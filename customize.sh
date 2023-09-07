#!/bin/bash

cd openwrt
sed -i 's|192.168.1.1|10.0.0.100|' package/base-files/files/bin/config_generate #修改默认IP地址
sed -i 's|+luci-theme-bootstrap ||' feeds/luci/collections/luci/Makefile #删除默认主题
sed -i 's|+luci-theme-bootstrap ||' feeds/luci/collections/luci-ssl-nginx/Makefile #删除默认主题
sed -i 's|+luci-theme-bootstrap ||' feeds/luci/collections/luci-light/Makefile #删除默认主题，ImmortalWrt版luci需要
sed -i 's|+luci ||' feeds/luci/libs/luci-lib-fs/Makefile #删除luci uhttpd关联
sed -i 's|+aria2||' feeds/packages/net/ariang/Makefile #删除AriaNg与Aria2关联
sed -i 's|+ariang||' feeds/luci/applications/luci-app-aria2/Makefile #删除AriaNg与Aria2关联
sed -i 's|http:\/\/\[DOMAIN]:\[PASSWORD]@dyn\.dns\.he\.net\/nic\/update?hostname=\[DOMAIN]\&myip=\[IP]|http:\/\/dyn\.dns\.he\.net\/nic\/update?hostname=\[DOMAIN]\&password=\[PASSWORD]\&myip=\[IP]|g' feeds/packages/net/ddns-scripts/files/services #Lean版Openwrt，修正He.net DDNS脚本错误
sed -i 's|http:\/\/\[DOMAIN]:\[PASSWORD]@dyn\.dns\.he\.net\/nic\/update?hostname=\[DOMAIN]\&myip=\[IP]|http:\/\/dyn\.dns\.he\.net\/nic\/update?hostname=\[DOMAIN]\&password=\[PASSWORD]\&myip=\[IP]|g' feeds/packages/net/ddns-scripts/files/usr/share/ddns/default/he.net.json #原版OpenWrt，修正He.net DDNS脚本错误，ImmortalWrt版
sed -i 's|status fastpath|status fastpath >/dev/null|g' feeds/luci/applications/luci-app-turboacc/luasrc/controller/turboacc.lua #修复TurboACC显示不正常
