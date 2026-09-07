#!/usr/bin/env bash
# GQYOS Live 环境 — 登录欢迎
set -euo pipefail

if [[ -f /usr/share/gqyos/logo.txt ]]; then
  cat /usr/share/gqyos/logo.txt
else
  printf '  GQYOS — 顾清影的 AI 系统\n'
fi

printf '\n  \033[1;32m==>\033[0m 运行 \033[1;36msudo gqyos-install\033[0m 开始安装\n'
printf '  \033[1;32m==>\033[0m 运行 \033[1;36mgqyos-doctor\033[0m 检查系统状态\n'
printf '\n'
