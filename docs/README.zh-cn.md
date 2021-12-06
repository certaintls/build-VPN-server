# 构建您自己的 VPN 服务器

这个项目提供了一个自动化工具，让你**安全**构建你的**高速** [Shadowsocks](https://shadowsocks.org/) 和/或 [Wireguard](https://www.wireguard.com/) VPN 服务器**在一分钟内** :zap: 使用 [Github.com Action](https://github.com/features/actions)。使用来自 [Linode](https://linode.com)、[Digital Ocean](https://www.digitalocean.com/) 等常见云提供商的 :moneybag: 5 美元/月服务器，您可以实时流式传输 4K 视频（速度 >= 25 Mpbs）。一旦你生成完你的VPN服务器配置信息，你可以简单地在[手机上扫描生成的二维码，立刻使用服务](https://github.com/certaintls/build-VPN-server/blob/main/docs/Client-Configurations.zh-cn.md)。

*短链接：[`http://git.io/buildVPN`](http://git.io/buildVPN)*
*以其他语言阅读：[英文](https://github.com/certaintls/build-VPN-server/blob/main/README.md)，[简体中文](https://github.com/certaintls/build-VPN-server/blob/main/docs/README.zh-cn.md)*

## 如何使用

总之，你需要`fork`这个存储库，通过[Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)设置你的服务器凭据，然后手动运行构建您的 VPN 服务器的工作流/操作，然后扫描生成的 QR 码以配置您的客户端应用程序。

### 详细说明

1. 先决条件：具有root权限的SSH访问服务器。如果您还没有服务器，从 [Linode](https://linode.com) 或 [Digital Ocean](https://www.digitalocean.com/) 购买 5 美元/月的实例会很容易开始。
3. [登录GitHub](https://github.com/login)
4. `Fork`这个仓库，通过点击页面右上角的Fork按钮 :point_up: 。 ![fork 这个项目](https://docs.github.com/assets/images/help/repository/fork_button.jpg)
5. 在您​​的分叉/自己的存储库中，为您的服务器设置 Github Encrypted Secrets：`HOST`、`USERNAME`、`PASSWORD` 或 `KEY`，如果您的端口号不是默认值，则可以选择使用 `PORT`。 ![通过 Github Secrets 设置您的 SSH 凭据](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/create_github_secrets.jpeg)
6. 在您的存储库导航中，单击“操作”，然后单击“构建 Shadowsocks 服务器”或“构建 Wireguard 服务器”，然后单击`Run workflow`（选择`Branch: main`）。 ![触发构建 VPN 工作流](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/start_build_vpn_workflow.jpeg) Shadowsocks 搭建有 单独Shadowsocks 和 Shadowsocks 加上 [kcptun](https://github.com/xtaci/kcptun)（实时优化）两种服务。Shadowsocks+kcptun 或 Wireguard 都非常快，您可以构建两者以实现冗余。请参阅更多[用例比较和配置的附加文档](https://github.com/certaintls/build-VPN-server/blob/main/docs/Client-Configurations.zh-cn.md)。
7. 构建需要一分钟，完成后查看结果，在`Configure your client`步骤下，有你的配置和二维码 ![Configure your client](https://raw.githubusercontent.com/certaintls/build-VPN-server/main/docs/configure_your_client.jpeg)
8. :bangbang: 如果您的存储库是公开的，则在您成功配置客户端应用程序后立即运行“删除工作流”。因为，即使您的秘密在日志输出中被屏蔽，生成的二维码也可以泄露您的秘密。不这样做可能会导致其他人在未经您许可的情况下使用您的 VPN。 ![删除工作流运行](https://docs.github.com/assets/images/help/settings/workflow-delete-run.png), [更多文档](https://docs.github.com/en/actions/managing-workflow-runs/deleting-a-workflow-run)

## 客户端应用程序配置
请参阅[客户端应用程序配置](https://github.com/certaintls/build-VPN-server/blob/main/docs/Client-Configurations.zh-cn.md)。

## 更新
这个项目/工具可能与您使用的大多数应用程序大不相同。您无需下载任何内容或在计算机中运行代码。一旦你按照说明“分叉”了这个项目，如果你熟悉 [Git](https://git-scm.com/)，你可以通过从上游拉取来更新你的副本。或者您可以简单地 [删除您的分叉存储库](https://docs.github.com/en/repositories/creating-and-managing-repositories/deleting-a-repository) 然后重新开始。

## 支持和贡献
您可以在此[主要项目问题](https://github.com/certaintls/build-VPN-server/issues) 上打开错误报告、功能请求或支持请求。另外，请阅读 [Contributing to Open Source Guides](https://github.com/github/opensource.guide/blob/main/CONTRIBUTING.md)
