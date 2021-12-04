# Build Your Own VPN Server

This project offers an automation tool to let you **securely** build your **high speed** [Shadosocks](https://shadowsocks.org/) and/or [Wireguard](https://www.wireguard.com/) VPN servers **in one minute** using [Github.com Action](https://github.com/features/actions). With a 5 USD/month server from common cloud providers like [Linode](https://linode.com), [Digital Ocean](https://www.digitalocean.com/), and so on, you can stream 4K videos (Speed >= 25 Mpbs) in real time.

*Shortlink: [`http://git.io/buildVPN`](http://git.io/buildVPN)*
*Read this in other languages: [English](https://github.com/certaintls/build-VPN-server/blob/main/README.md), [简体中文](https://github.com/certaintls/build-VPN-server/blob/main/docs/README.zh-cn.md)*

## How to use

In summary, you need to `fork` this repository, set up your server credentials via [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), then manually run the workflows/actions to build your VPN servers, then scan the resulting QR codes to configure your client side apps.

### Detailed Instruction

1. Prerequisite: have SSH access to a server with root permission. If you don't have a server yet, buying a $5/month instance from [Linode](https://linode.com) or [Digital Ocean](https://www.digitalocean.com/) would be an easy start.
2. [Sign in to GitHub](https://github.com/login)
3. `Fork` this repository, by click the Fork button in the top-right corner of the page. ![Fork this project](https://docs.github.com/assets/images/help/repository/fork_button.jpg)
4. In your forked/own repository, set up Github Encrypted Secrets for your server: `HOST`, `USERNAME`, either `PASSWORD` or `KEY`, and optionally `PORT` if your port number is not default. ![Set your SSH credentials via Github Secrets](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/create_github_secrets.jpeg) 
5. On your repository navigation, click `Actions`, then click `Build Shadowsocks Server` or `Build Wireguard Server`, then click `Run workflow` (from `main`) ![Trigger a build VPN workflow](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/start_build_vpn_workflow.jpeg)
6. The build should take one minute, once it's finished, check the result, under `Configure your client` step, there are your configurations and QR-code
7. :bangbang: If your repository is public, `Delete workflow run` immediately after you successfully configure your client side app. Because, even though your secrets are masked in the log output, the generated QR-Code can reveal your secrets. Failing to do so can result in other people using your VPN without your permission. ![Delete workflow run](https://docs.github.com/assets/images/help/settings/workflow-delete-run.png), [more doc](https://docs.github.com/en/actions/managing-workflow-runs/deleting-a-workflow-run)

## Support & Contributing
You can open bug report, feature request or support request on this [main project issues](https://github.com/certaintls/build-VPN-server/issues). Also, please read [Contributing to Open Source Guides](https://github.com/github/opensource.guide/blob/main/CONTRIBUTING.md)
