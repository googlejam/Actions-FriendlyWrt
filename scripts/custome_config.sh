#!/bin/bash

# Define the master config file for your R5C
CONF="configs/rockchip/01-nanopi"

# Remove the 'Heavy' stuff that causes security/bloat concerns
# We use 'sed' to change '=y' to 'is not set'
for PKG in vssr turboacc unblockneteasemusic xlnetacc zerotier adbyby-plus; do
    sed -i "s/CONFIG_PACKAGE_luci-app-$PKG=y/# CONFIG_PACKAGE_luci-app-$PKG is not set/g" $CONF
done

# Clean up build artifacts to save space
sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' $CONF
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' $CONF
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' $CONF
