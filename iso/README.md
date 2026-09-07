# GQYOS ISO 构建

## 依赖

Arch Linux 环境 + archiso:

```bash
sudo pacman -S archiso
```

## 本地构建

```bash
# 需要 root 权限
sudo ./build-iso.sh

# 清理构建目录
./build-iso.sh --clean
```

ISO 输出到 `out/` 目录。

## CI/CD 自动构建

推送 `v*` tag 自动触发 GitHub Actions 构建 ISO 并发布到 Release:

```bash
git tag v26.09.07
git push origin v26.09.07
```

## ISO 内容

| 组件 | 说明 |
|------|------|
| 引导 | GRUB (UEFI) + systemd-boot |
| 安装器 | live-setup/install-arch.sh |
| Live 用户 | root (免密) |
| 桌面 | 无 (纯 CLI Live 环境) |
| 网络 | NetworkManager + iwd |
| 字体 | Noto (中日韩 + Emoji) |

## 启动选项

| 选项 | 用途 |
|------|------|
| 默认 | 正常启动 Live 环境 |
| NVIDIA | 启用 NVIDIA 驱动 |
| 安全模式 | nomodeset |

## 写入 U盘

```bash
# dd 方式
sudo dd if=out/GQYOS-*.iso of=/dev/sdX bs=4M status=progress

# Ventoy 方式
# 直接将 ISO 拷贝到 Ventoy U盘
```
