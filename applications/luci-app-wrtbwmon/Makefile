#
# Copyright (C) 2018 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-wrtbwmon
PKG_VERSION:=0.7.0
PKG_RELEASE:=1

LUCI_TITLE:=LuCI Per-User Bandwidth Monitoring
LUCI_DEPENDS:=+wrtbwmon
LUCI_PKGARCH:=all

PKG_LICENSE:=Apache-2.0

define Package/$(PKG_NAME)/config
# shown in make menuconfig <Help>
help
	$(LUCI_TITLE)
	.
	Version: $(PKG_VERSION)-$(PKG_RELEASE)
endef

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
