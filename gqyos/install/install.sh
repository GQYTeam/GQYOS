#!/usr/bin/env bash
# GQYOS 首次安装脚本
# 在 ISO Live 环境中运行
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "╔══════════════════════════════════╗"
echo "║   GQYOS 安装器                   ║"
echo "║   为顾清影而造                   ║"
echo "╚══════════════════════════════════╝"
echo ""

# 检查网络
if ! ping -c 1 archlinux.org &>/dev/null; then
  echo "错误: 网络未连接"
  echo "请先连接: nmcli device wifi connect <SSID>"
  exit 1
fi

# 检查 UEFI
if [[ ! -d /sys/firmware/efi ]]; then
  echo "错误: 非 UEFI 模式"
  exit 1
fi

# 运行 live-setup
INSTALLER="/opt/gqyos/live-setup/install-arch.sh"
if [[ -f "$INSTALLER" ]]; then
  exec bash "$INSTALLER" "$@"
else
  echo "错误: 安装器不存在: $INSTALLER"
  echo "请从 https://github.com/GQYTeam/live-setup 获取"
  exit 1
fi
