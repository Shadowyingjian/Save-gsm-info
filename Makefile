#For more information,please refer to https://openwrt.org/docs/guide-developer/packages
include $(TOPDIR)/rules.mk

PKG_NAME:=Save-GSM-Info
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/Save-GSM-Info
  SECTION:=base
  CATEGORY:=Save-GSM-Info
  TITLE:=Save-GSM-Info
endef



define Build/Configure
  $(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

#please pay attention to the start tab key.
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR) 
endef

define Package/Save-GSM-Info/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Save-GSM-Info $(1)/usr/bin/Save-GSM-Info
endef

$(eval $(call BuildPackage,Save-GSM-Info))

