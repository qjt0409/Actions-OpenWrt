#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#!/bin/bash
# 添加软件源 feeds
sed -i '1i src-git istore https://github.com/istoreos/istoreos-feeds.git;main' feeds.conf.default
sed -i '1i src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' feeds.conf.default
sed -i '1i src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' feeds.conf.default
sed -i '1i src-git lucky https://github.com/gdy666/luci-app-lucky.git;main' feeds.conf.default
sed -i '1i src-git ddnsgo https://github.com/sirpdboy/luci-app-ddns-go.git' feeds.conf.default
sed -i '1i src-git push https://github.com/zzsj001/luci-app-pushd.git' feeds.conf.default
sed -i '1i src-git wechatpush https://github.com/tty228/luci-app-wechatpush.git' feeds.conf.default
sed -i '1i src-git alist https://github.com/sirpdboy/luci-app-alist.git' feeds.conf.default
sed -i '1i src-git easycloud https://github.com/linkease/istore-packages.git' feeds.conf.default
sed -i '1i src-git turboacc https://github.com/chenmozhijin/turboacc.git' feeds.conf.default

./scripts/feeds update -a
