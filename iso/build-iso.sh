#!/usr/bin/env bash
# GQYOS ISO 构建脚本
# 用法: sudo ./build-iso.sh [--clean]
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="$SCRIPT_DIR/profile"
WORK_DIR="$SCRIPT_DIR/work"
OUT_DIR="$SCRIPT_DIR/out"

if [[ "${1:-}" == "--clean" ]]; then
  rm -rf "$WORK_DIR" "$OUT_DIR"
  exit 0
fi

command -v mkarchiso &>/dev/null || { echo "错误: 未安装 archiso (sudo pacman -S archiso)"; exit 1; }
[[ $EUID -eq 0 ]] || { echo "错误: 需要 root"; exit 1; }

echo "GQYOS ISO 构建 — $(cat "$SCRIPT_DIR/../gqyos/version" 2>/dev/null || echo dev)"

# 将 gqyos/ 注入 profile
mkdir -p "$PROFILE_DIR/airootfs/usr/share/gqyos"
mkdir -p "$PROFILE_DIR/airootfs/usr/bin"
mkdir -p "$PROFILE_DIR/airootfs/opt/gqyos"

cp -r "$SCRIPT_DIR/../gqyos/bin/"* "$PROFILE_DIR/airootfs/usr/bin/" 2>/dev/null || true
cp -r "$SCRIPT_DIR/../gqyos/"* "$PROFILE_DIR/airootfs/usr/share/gqyos/" 2>/dev/null || true
cp "$SCRIPT_DIR/../gqyos/version" "$PROFILE_DIR/airootfs/usr/share/gqyos/" 2>/dev/null || true

# 复制安装器
cp "$SCRIPT_DIR/../live-setup/install-arch/install-arch.sh" "$PROFILE_DIR/airootfs/opt/gqyos/" 2>/dev/null || true

mkarchiso -w "$WORK_DIR" -D "$OUT_DIR" "$PROFILE_DIR"

echo "构建完成: $OUT_DIR/"
ls -lh "$OUT_DIR"/*.iso 2>/dev/null || true
