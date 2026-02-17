#!/bin/bash

# Standard debloat: removing toolchain and SDK to save space
sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' configs/rockchip/01-nanopi

# --- New Debloat Section ---
# This disables the heavy plugins that usually come pre-installed
TARGET_CONF="configs/rockchip/01-nanopi"

for PKG in luci-app-vssr luci-app-turboacc luci-app-unblockneteasemusic luci-app-xlnetacc luci-app-zerotier luci-app-adbyby-plus; do
    sed -i "s/CONFIG_PACKAGE_${PKG}=y/# CONFIG_PACKAGE_${PKG} is not set/g" $TARGET_CONF
done
