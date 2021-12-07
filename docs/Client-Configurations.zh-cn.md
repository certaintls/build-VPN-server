# 客户端应用配置

VPN 的客户端应用程序可以进行不同的配置以支持不同的用例：浏览器代理、移动设备的 VPN 模式、桌面操作系统范围的 VPN 和路由器上的 VPN 集成。请参阅下面的更多详细信息，以了解哪些用例可能适合您。

## 浏览器代理

在此用例中，VPN 服务被配置为桌面上特定端口上可用的 HTTP 代理。然后，浏览器扩展程序可以将您的网络流量重新路由到此本地端口以使用 VPN 服务。此配置可以利用路由规则列表仅将流量（被阻止）路由到 VPN 服务。因此，您可以使用常规 Internet 连接浏览其余的网页。此配置可以为通过本地连接提供的站点以及通过 VPN 服务阻止的站点提供最佳速度。 Shadowsocks 但不是 Wireguard 可以支持这种配置。
要设置它，您通常需要

1. 在[谷歌浏览器](https://www.google.com/chrome/)上安装[Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
2. 无论你的操作系统（Windows、MacOS还是Linux），[安装Docker](https://docs.docker.com/get-docker/)，然后运行这个命令`docker run --name gost-ss-kcp - p 9999:9999 -d ginuerzh/gost -L=:9999 -F=ss+kcp://chacha20-ietf-poly1305:SS_PASSWORD@SERVER_ADDRESS:6543?nodelay=true`
    * `SS_PASSWORD`：您在 Github.com Action 工作流程中生成的 Shadowsocks 密码
    * `SERVER_ADDRESS`：您的服务器地址
3. 配置您的 SwitchOmega 扩展以在端口“9999”上使用本地“socks5”代理。然后，设置你的转发规则，或者订阅一个在线列表（例如中国用户可以订阅[GFW列表](https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt)）

## 移动设备的 VPN 模式

与替代方案相比，这种配置是东方的。

### 使用 Shadowsocks

* 下载 [Big Boss on iOS](http://apt.thebigboss.org/onepackage.php?bundleid=com.linusyang.shadowsocks)
* 或下载 [Android 上的Shadowsocks](https://play.google.com/store/apps/details?id=com.github.shadowsocks)
* 通过扫描之前生成的二维码添加新配置

### 使用 Wireguard

* 下载 [iOS上的Wireguard](https://apps.apple.com/us/app/wireguard/id1441195209)
* 或下载 [Wireguard on Android](https://play.google.com/store/apps/details?id=com.wireguard.android)
* 通过扫描之前生成的二维码添加新配置

## 桌面操作系统范围的 VPN

与仅用于浏览器的代理模式相比，台式机/笔记本电脑上有许多非浏览器应用程序，因此，使用此配置让您的所有应用程序通过隧道：

文档工作正在进行中。贡献将不胜感激。

## 路由器上的 VPN 集成

现在有很多物联网设备，比如智能音箱，它们没有内置VPN客户端。因此，将VPN集成到路由器级别将使网络上的某些或任何设备具有使用VPN服务的能力。

### 路由器上的 Shadowocks

您的路由器需要 [OpenWRT](https://openwrt.org/)。文档工作正在进行中。贡献将不胜感激。

### 路由器上的 Wireguard

存在一个简单的解决方案：

1. 购买任何一款[GL-iNet 路由器](https://www.gl-inet.com/) 并设置一个。
2. 扫描或使用上一步为客户端生成的配置。
