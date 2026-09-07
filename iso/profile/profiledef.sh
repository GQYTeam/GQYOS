#!/usr/bin/env bash
# GQYOS archiso profile 定义
# 参考: https://wiki.archlinux.org/title/Archiso

# ========== 基础信息 ========== #
profile_name="GQYOS"
profile_version="v$(date +%Y.%m.%d)"
profile_publisher="GQYOS Team"
profile_application_name="GQYOS Install Medium"

# ========== 引导加载 ========== #
# 使用 systemd-boot (UEFI)
bootmode=("uefi-x64-systemd-boot")

# ========== 用户 ========== #
user_shell="/bin/zsh"
