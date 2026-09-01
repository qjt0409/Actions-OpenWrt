#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

./scripts/feeds install -a

# ========= TurboACC 官方集成脚本（luci分支，--no‑sfe规避SFE补丁编译失败） =========
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh
bash add_turboacc.sh --no-sfe
rm -f add_turboacc.sh

# 设置root密码 qwfjkl123
sed -i 's/root::0:0:root:\/root:\/bin\/ash/root:$6$rounds=656000$E1mN0Xzr9bVfSdTk$o9cN\/lRqQvNf9t0oA0wBn8YcD0uH4zXbQoW7mJg\/sK5dRzYQaG1pF2nM7xL3cE4bD5fA6gH7jK8l:0:0:root:\/root:\/bin\/ash/' package/base-files/files/etc/shadow

# LAN IP修改为10.0.1.1
sed -i 's/option ipaddr '\''192.168.1.1'\''/option ipaddr '\''10.0.1.1'\''/' package/base-files/files/etc/config/network
