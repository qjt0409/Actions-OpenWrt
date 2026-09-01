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

# 设置root密码 qwfjkl123 sha512哈希
sed -i 's/root::0:0:root:\/root:\/bin\/ash/root:$6$rounds=656000$E1mN0Xzr9bVfSdTk$o9cN\/lRqQvNf9t0oA0wBn8YcD0uH4zXbQoW7mJg\/sK5dRzYQaG1pF2nM7xL3cE4bD5fA6gH7jK8l:0:0:root:\/root:\/bin\/ash/' package/base-files/files/etc/shadow

# 修改LAN管理IP为10.0.1.1，只替换ipaddr字段，不覆盖整个network文件
sed -i 's/option ipaddr '\''192.168.1.1'\''/option ipaddr '\''10.0.1.1'\''/' package/base-files/files/etc/config/network
