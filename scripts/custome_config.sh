#!/bin/bash

# Target the specific config for Rockchip devices
CONF="configs/rockchip/01-nanopi"

# Remove the 'Heavy' stuff that usually comes pre-installed
# This converts '=y' to '# ... is not set'
for PKG in vssr turboacc unblockneteasemusic xlnetacc zerotier adbyby-plus; do
    sed -i "s/CONFIG_PACKAGE_luci-app-$PKG=y/# CONFIG_PACKAGE_luci-app-$PKG is not set/g" $CONF
done

# Standard FriendlyWrt clean-up
sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' $CONF
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' $CONF
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' $CONF
