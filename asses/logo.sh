#!/usr/bin/env bash
# GQYOS — 为顾清影打造的 AI 系统标志
# 用法: source logo.sh  或  bash logo.sh
#
# 显示 GQYOS 炫彩实体字符 logo（由 oh-my-logo 生成）
# 顾清影的专属系统，每次启动都值得一个好心情 ✨

_GQYOS_LOGO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

_gqyos_logo_print() {
  local style="${1:-sunset}"
  local file="${_GQYOS_LOGO_DIR}/gqyos-logo-${style}.ansi"
  if [[ -f "$file" ]]; then
    cat "$file"
  else
    echo "GQYOS"  # fallback: plain text
  fi
}

# 如果直接运行（非 source），打印默认 logo
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  _gqyos_logo_print "${1:-sunset}"
fi
