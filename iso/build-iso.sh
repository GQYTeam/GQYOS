#!/usr/bin/env bash
# GQYOS ISO 构建脚本
# 用法: ./build-iso.sh [--clean]
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="$SCRIPT_DIR/profile"
WORK_DIR="$SCRIPT_DIR/work"
OUT_DIR="$SCRIPT_DIR/out"

if [[ "${1:-}" == "--clean" ]]; then
  echo "清理构建目录..."
  rm -rf "$WORK_DIR" "$OUT_DIR"
  exit 0
fi

# 检查 archiso
if ! command -v mkarchiso &>/dev/null; then
  echo "错误: 未找到 mkarchiso。请先安装 archiso:"
  echo "  sudo pacman -S archiso"
  exit 1
fi

# 检查 root 权限
if [[ $EUID -ne 0 ]]; then
  echo "错误: 需要 root 权限运行 mkarchiso"
  echo "  sudo ./build-iso.sh"
  exit 1
fi

echo "╔══════════════════════════════════╗"
echo "║   GQYOS ISO 构建                  ║"
echo "║   为顾清影而造                     ║"
echo "╚══════════════════════════════════╝"
echo ""
echo "Profile: $PROFILE_DIR"
echo "Work:    $WORK_DIR"
echo "Output:  $OUT_DIR"
echo ""

mkarchiso -w "$WORK_DIR" -D "$OUT_DIR" "$PROFILE_DIR"

echo ""
echo "构建完成！ISO 位于: $OUT_DIR/"
ls -lh "$OUT_DIR"/*.iso 2>/dev/null || echo "（未找到 ISO 文件）"
