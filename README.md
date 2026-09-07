<div align="center">

<img src="asses/GQYOS-logo.png" alt="GQYOS logo" width="220">

# GQYOS

### 顾清影的 AI 系统 — 为她而造

> GQYOS 是一个为顾清影打造的 AI 驱动 Arch Linux 系统。
> 它不只是操作系统，而是她与数字世界交互的智能伙伴。

基于 Arch Linux，面向 Hyprland、加密磁盘与可重复安装流程的个人 Linux 系统项目。

[![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=archlinux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?logo=hyprland&logoColor=111111)](https://hyprland.org/)
[![Status](https://img.shields.io/badge/status-in%20development-F2C94C)](https://github.com/GQYTeam/GQYOS)

</div>

## 项目理念

GQYOS 的核心使命是**为顾清影提供一个完整的 AI 系统体验**。它不只是一个安装脚本集合，而是一个从零开始、为她量身定制的智能工作环境：

- **AI 原生** — 系统集成 AI 工具链，让顾清影随时可以与 AI 协作
- **安全优先** — LUKS2 全盘加密保护她的数据和隐私
- **优雅高效** — Hyprland 工作站提供流畅的键盘驱动体验
- **可重复** — 一键安装、一键恢复，不需要反复配置

GQYOS 希望把 Arch Linux 的自由度，整理成一套能够真正安装、使用和持续维护的系统体验。从 Live 环境开始，完成磁盘、基础系统、启动配置，再进入一个适合日常工作的 Hyprland 工作站。

## 快速开始

> [!CAUTION]
> 安装器默认会清空选中的整块磁盘。运行前请确认目标设备，并备份所有重要数据。

请从 GQYOS Live ISO 启动，系统会自动进入安装环境：

```bash
# 运行安装器
sudo gqyos-install
```

ISO 从 [Releases](https://github.com/GQYTeam/GQYOS/releases) 下载，或在 Arch Linux Live ISO 上直接运行安装脚本：

```bash
curl -fsSL https://raw.githubusercontent.com/GQYTeam/live-setup/main/install-arch/install-arch.sh | bash
```

安装前请先阅读 [Live Setup 安装说明](https://github.com/GQYTeam/live-setup)。不支持双系统、保留现有分区或在已安装系统上升级。

## 系统特性

| 安装基础 | 工作环境 | 系统维护 |
| --- | --- | --- |
| UEFI + GRUB | Hyprland 工作站 | `--dry-run` 预览 |
| LUKS2 + LVM | 最小 CLI 模式 | `--resume` 恢复安装 |
| NetworkManager | VirtualBox 模式 | 独立诊断日志 |
| UFW + fail2ban | zsh、Docker、Rust | 单独测试与发布 |

## 安装模式

| 模式 | 适用场景 |
| --- | --- |
| **Minimal CLI** | 需要干净命令行系统，后续自行配置 |
| **Hyprland Workstation** | 日常使用的现代桌面工作站 |
| **VirtualBox Workstation** | 在虚拟机中体验和验证 GQYOS |

## 适合谁

GQYOS 首先为**顾清影**而造 —— 她需要一个安全、智能、高效的工作环境。

同时也适合希望减少重复配置、偏好键盘驱动桌面、需要磁盘加密，并且愿意维护 Arch Linux 的用户。

它不是面向完全零基础用户的一键系统。你需要理解目标磁盘、UEFI、分区和 LUKS 密码的重要性；加密密码丢失后，数据无法恢复。

## 项目结构

GQYOS 由一个系统总仓库和两个独立组件组成：

| 项目 | 负责内容 |
| --- | --- |
| [GQYOS](https://github.com/GQYTeam/GQYOS) | 系统方向、ISO 构建、版本关系、集成说明和用户文档 |
| [Live Setup](https://github.com/GQYTeam/live-setup) | Live 环境中的磁盘、系统和启动配置 |
| [GQY Arch Setup](https://github.com/GQYTeam/gqy-arch-setup) | 已安装系统中的桌面、工具和基础环境 |

组件拥有独立的 Git 历史、测试流程和发布周期。GQYOS 负责记录经过验证的组件组合。

## ISO 构建

```bash
# 本地构建 (需要 Arch Linux + archiso)
sudo pacman -S archiso
sudo ./iso/build-iso.sh

# 自动构建: 推送 tag 触发 CI
git tag v25.01.01
git push origin v25.01.01
```

详见 [iso/README.md](iso/README.md)。

## 安全检查

运行安装器前，请确认：

- 目标磁盘中没有需要保留的数据
- 重要文件已经备份到其他设备
- 已确认启动模式和目标磁盘
- 已记录并妥善保存 LUKS 加密密码

建议先在 VirtualBox 或其他可丢弃的测试设备中验证安装流程。

## 项目状态

GQYOS 仍在持续开发中。安装器、桌面配置和组件之间的兼容关系可能发生变化，使用前请查看对应仓库的最新说明、变更记录和已知问题。

## 开发者入口

需要同时开发全部组件时，可以分别克隆：

```bash
git clone https://github.com/GQYTeam/GQYOS.git
git clone https://github.com/GQYTeam/gqy-arch-setup.git
git clone https://github.com/GQYTeam/live-setup.git
```

## 许可证

具体许可证以各组件仓库中的许可证文件为准：

- [GQY Arch Setup License](https://github.com/GQYTeam/gqy-arch-setup/blob/master/LICENSE)
- [Live Setup License](https://github.com/GQYTeam/live-setup/blob/main/install-arch/LICENSE)
