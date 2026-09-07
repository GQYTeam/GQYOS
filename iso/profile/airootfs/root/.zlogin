#!/usr/bin/env bash
# GQYOS Live 环境入口脚本
# 用户登录后自动运行
set -euo pipefail

_GQYOS_LOGO_DIR="/usr/share/gqyos"

# 显示 logo
if [[ -f "${_GQYOS_LOGO_DIR}/gqyos-logo-sunset.ansi" ]]; then
  cat "${_GQYOS_LOGO_DIR}/gqyos-logo-sunset.ansi"
else
  printf '  ____  _____   _____  ____\n / ___|/ _ \\ \\ / / _ \\/ ___|\n| |  _| | | \\ V / | | \\___ \\\n| |_| | |_| || || |_| |___) |\n \\____|\\__\\_\\|_| \\___/|____/\n'
fi

printf '\n'
printf '  GQYOS Live 环境\n'
printf '  为顾清影而造\n'
printf '\n'
printf '  \033[1;32m==>\033[0m 运行 \033[1;36msudo gqyos-install\033[0m 开始安装\n'
printf '  \033[1;32m==>\033[0m 运行 \033[1;36mgqyos-docs\033[0m 查看安装说明\n'
printf '\n'
