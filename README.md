# Build Your Own VPN Server

This project offers an automation tool to let you **securely** build your **high speed** [Shadosocks](https://shadowsocks.org/) and/or [Wireguard](https://www.wireguard.com/) VPN servers **in one minute** using [Github.com Action](https://github.com/features/actions). With a 5 USD/month server from common cloud providers like [Linode](https://linode.com), [Digital Ocean](https://www.digitalocean.com/), and so on, you can stream 4K videos (Speed >= 25 Mpbs) in real time.

*Shortlink: [`http://git.io/buildVPN`](http://git.io/buildVPN)*
*Read this in other languages: [English](https://github.com/certaintls/build-VPN-server/blob/main/README.md), [简体中文](https://github.com/certaintls/build-VPN-server/blob/main/docs/README.zh-cn.md)

## How to use

In summary, you need to `fork` this repository, set up your server credentials via [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), then manually run the workflows/actions to build your VPN servers, then scan the resulting QR codes to configure your client side apps.

### Detailed Instruction

1. Prerequisite: have SSH access to a server with root permission. If you don't have a server yet, buying a $5/month instance from [Linode](https://linode.com) or [Digital Ocean](https://www.digitalocean.com/) would be an easy start.
2. [Sign in to GitHub](Sign in to GitHub)
3. `Fork` this repository, by click the Fork button on the top right.
4. In your forked/own repository, set up Github Encrypted Secrets for your server: `HOST`, `USERNAME`, either `PASSWORD` or `KEY`, and optionally `PORT` if your port number is not default. ![Set your SSH credentials via Github Secrets](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/create_github_secrets.jpeg) 
5. On your repository navigation, click `Actions`, then click `Build Shadowsocks Server` or `Build Wireguard Server`, then click `Run workflow` (from `main`)
