#!/usr/bin/env bash
# GQYOS archiso profile 定义

profile_name="GQYOS"
profile_version="v$(date +%Y.%m.%d)"
profile_publisher="GQYOS Team"
profile_application_name="GQYOS Install Medium"

# 使用 grub
bootmode=("bios-efi-x86_64-grub")

user_shell="/bin/bash"
