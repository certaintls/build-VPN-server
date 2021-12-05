# Client side app configurations

The client side application of VPN can be configured differently to support different use cases: A proxy for browsers, VPN mode for your mobile devices, Operating System wide VPN for desktop and VPN integration on routers. Shadowsocks but not Wireguard can support this configuration. Please see more details below to see what use case(s) might work well for you.

## A proxy for browsers

In this use case, a VPN service is configured as a HTTP proxy avaiable on a specific port on your desktop. Then, a browser extension can re-route your web traffic to this local port to use the VPN service. This configuration can take advantage of routing rules list to only route traffic (blocked) to the VPN service. Therefore, you can browse the rest of web pages using your regular Internet connection. This configuratio can offer the best speed to both sites that avaiable through local connection as well as blocked sites through VPN service.
To set this up, you usually need to 

1. Install [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif) on [Google Chrome](https://www.google.com/chrome/)
2. Regardless your OS (Windows, MacOS or Linux), [install Docker](https://docs.docker.com/get-docker/), then run this command `docker run --name gost-ss-kcp -p 9999:9999 -d ginuerzh/gost -L=:9999 -F=ss+kcp://chacha20-ietf-poly1305:SS_PASSWORD@SERVER_ADDRESS:6543?nodelay=true`
    * `SS_PASSWORD`: Your Shadowsocks password generated in your Github.com Action workflow
    * `SERVER_ADDRESS`: Your server address
3. Configure your SwitchOmega extension to use a local `socks5` proxy on port `9999`. Then, set up your forward rules, or subscribe an online list (For example, Users in China can subscribe to [GFW List](https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt)) 

## VPN mode for your mobile devices
