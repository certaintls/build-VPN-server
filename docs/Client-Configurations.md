# Client side app configurations

The client side application of VPN can be configured differently to support different use cases: A proxy for browsers, VPN mode for your mobile devices, Operating System wide VPN for desktop and VPN integration on routers. Please see more details below to see what use case(s) might work well for you.

## A proxy for browsers

In this use case, a VPN service is configured as a HTTP proxy avaiable on a specific port on your desktop. Then, a browser extension can re-route your web traffic to this local port to use the VPN service. This configuration can take advantage of routing rules list to only route traffic (blocked) to the VPN service. Therefore, you can browse the rest of web pages using your regular Internet connection. This configuratio can offer the best speed to both sites that avaiable through local connection as well as blocked sites through VPN service. Shadowsocks but not Wireguard can support this configuration.
To set this up, you usually need to 

1. Install [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif) on [Google Chrome](https://www.google.com/chrome/)
2. Regardless your OS (Windows, MacOS or Linux), [install Docker](https://docs.docker.com/get-docker/), then run this command `docker run --name gost-ss-kcp -p 9999:9999 -d ginuerzh/gost -L=:9999 -F=ss+kcp://chacha20-ietf-poly1305:SS_PASSWORD@SERVER_ADDRESS:6543?nodelay=true`
    * `SS_PASSWORD`: Your Shadowsocks password generated in your Github.com Action workflow
    * `SERVER_ADDRESS`: Your server address
3. Configure your SwitchOmega extension to use a local `socks5` proxy on port `9999`. Then, set up your forward rules, or subscribe an online list (For example, Users in China can subscribe to [GFW List](https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt)) 

## VPN mode for your mobile devices

This configuration is the east comparing to the alternatives. 

### Use Shadowsocks

* Download [Big Boss on iOS](http://apt.thebigboss.org/onepackage.php?bundleid=com.linusyang.shadowsocks)
* Or Download [Shadowsocks on Android](https://play.google.com/store/apps/details?id=com.github.shadowsocks)
* Add a new configuration by scanning the QR-code generated previously

### Use Wireguard

* Download [Wireguard on iOS](https://apps.apple.com/us/app/wireguard/id1441195209)
* Or Download [Wireguard on Android](https://play.google.com/store/apps/details?id=com.wireguard.android)
* Add a new configuration by scanning the QR-code generated previously

## Operating System wide VPN for desktop

Comparing to proxy mode just for browsers, there are many non-browser apps on desktop/laptop computers, therefore, using this configuration to let all your applications to tunnel through:

Documentation work in progress. Contribution will be appreciated.

## VPN integration on routers

Nowadays, there are many IoT devices, such as smart speakers, they don't have VPN client built in. So, putting VPN integration on the router level would give  some or any devices on the network the capability of utilizing VPN service.

### Shadowocks on the router

you will need [OpenWRT](https://openwrt.org/) on your router. Documentation work in progress. Contribution will be appreciated.

### Wireguard on the router

An easy solution exists:

1. Buy any [GL-iNet routers](https://www.gl-inet.com/) and set one up.
2. Scan or use the generated configuration for the client from previous step.
