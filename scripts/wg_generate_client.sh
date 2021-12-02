#!/bin/bash

# Assume an exist server is running in the container called wireguard

readonly INTERFACE="wg0"

# Generate peer keys
readonly PRIVATE_KEY=$(docker run --rm -i masipcat/wireguard-go wg genkey)
readonly PUBLIC_KEY=$(echo ${PRIVATE_KEY} | docker run --rm -i masipcat/wireguard-go wg pubkey)
readonly SERVER_ADDRESS=$1
readonly PRESHARED_KEY=$(docker run --rm -i masipcat/wireguard-go wg genpsk)

# Read server key from interface
readonly SERVER_PUBLIC_KEY=$(docker exec wireguard wg show ${INTERFACE} public-key)

# Get next free peer IP (This will break after x.x.x.255)
readonly PEER_ADDRESS=$(docker exec wireguard wg show ${INTERFACE} allowed-ips | cut -f 2 | awk -F'[./]' '{print $1"."$2"."$3"."1+$4"/"$5}' | sort -t '.' -k 1,1 -k 2,2 -k 3,3 -k 4,4 -n | tail -n1)

# Add peer
docker exec wireguard wg set ${INTERFACE} peer ${PUBLIC_KEY} preshared-key < echo ${PRESHARED_KEY} allowed-ips ${PEER_ADDRESS}

# Logging
echo "Added peer ${PEER_ADDRESS} with public key ${PUBLIC_KEY}"

# Generate peer config QR code
cat << END_OF_CONFIG | docker run --rm -i --net=none thomasleplus/qrcode qrencode -t ANSIUTF8
[Interface]
Address = ${PEER_ADDRESS}
PrivateKey = ${PRIVATE_KEY}
DNS = 1.1.1.1,8.8.8.8

[Peer]
PublicKey = ${SERVER_PUBLIC_KEY}
PresharedKey = ${PRESHARED_KEY}
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = ${SERVER_ADDRESS}:51820
END_OF_CONFIG
