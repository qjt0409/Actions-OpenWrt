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

# ========== 清理全部旧的src‑git源，避免重复报错 ==========
sed -i '/^src-git /d' feeds.conf.default

# 函数：仅当源不存在时才添加，防止重复
add_feed(){
    local name="$1"
    local line="$2"
    if ! grep -q "^src-git $name" feeds.conf.default;then
        echo "$line" >> feeds.conf.default
    fi
}

# 增加需要的插件源
add_feed "helloworld"    "src-git helloworld https://github.com/fw876/helloworld"
add_feed "istore"        "src-git istore https://github.com/istoreos/istoreos-feeds.git;main"
add_feed "passwall"      "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main"
add_feed "passwall2"     "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main"
add_feed "lucky"         "src-git lucky https://github.com/gdy666/luci-app-lucky.git;main"
add_feed "ddnsgo"        "src-git ddnsgo https://github.com/sirpdboy/luci-app-ddns-go.git"
add_feed "push"          "src-git push https://github.com/zzsj001/luci-app-pushd.git"
add_feed "wechatpush"    "src-git wechatpush https://github.com/tty228/luci-app-wechatpush.git"
add_feed "alist"         "src-git alist https://github.com/sirpdboy/luci-app-alist.git"
add_feed "easycloud"     "src-git easycloud https://github.com/linkease/istore-packages.git"
add_feed "turboacc"      "src-git turboacc https://github.com/chenmozhijin/turboacc.git"

./scripts/feeds update -a
