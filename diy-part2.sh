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

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
#!/bin/bash
./scripts/feeds install -a

# 设置root密码 qwfjkl123  sha512哈希
sed -i 's/root::0:0:root:\/root:\/bin\/ash/root:$6$rounds=656000$E1mN0Xzr9bVfSdTk$o9cN\/lRqQvNf9t0oA0wBn8YcD0uH4zXbQoW7mJg\/sK5dRzYQaG1pF2nM7xL3cE4bD5fA6gH7jK8l:0:0:root:\/root:\/bin\/ash/' package/base-files/files/etc/shadow

# 修改LAN管理IP为 10.0.1.1
cat > package/base-files/files/etc/config/network <<'EOF'
config interface 'loopback'
        option device 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd10:0101::/48'

config device
        option name 'br-lan'
        option type 'bridge'
        list ports 'eth0'

config interface 'lan'
        option device 'br-lan'
        option proto 'static'
        option ipaddr '10.0.1.1'
        option netmask '255.255.255.0'
        option ip6assign '60'
EOF
