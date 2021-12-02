#!/bin/bash

# Generate server keys
docker run --rm -i masipcat/wireguard-go wg genkey > privatekey
docker run --rm -i masipcat/wireguard-go wg pubkey < privatekey > publickey

readonly INTERFACE="wg0"

# Generate peer keys
readonly PRIVATE_KEY=$(cat privatekey)

# Generate server config
cat << END_OF_CONFIG > ${INTERFACE}.conf
[Interface]
PrivateKey = ${PRIVATE_KEY}
Address = 10.0.0.1/24
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 51820
END_OF_CONFIG

# Preemptively stop the previous instance
docker stop wireguard && docker rm -v wireguard

# Start the server
docker run --restart=always --name wireguard --cap-add=NET_ADMIN --sysctl=net.ipv4.ip_forward=1 -v /dev/net/tun:/dev/net/tun -v $PWD:/etc/wireguard -e WG_COLOR_MODE=always -e LOG_LEVEL=info -p 51820:51820/udp -d masipcat/wireguard-go
