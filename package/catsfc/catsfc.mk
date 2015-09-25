################################################################################
#
# CATSFC
#
################################################################################
CATSFC_VERSION = 64ffe869caba187b8c7205ad6182f5c603008128
CATSFC_SITE = $(call github,libretro,CATSFC-libretro,$(CATSFC_VERSION))
CATSFC_TARGET = libcatsfc.so

define CATSFC_BUILD_CMDS
	$(MAKE) USE_BLARGG_APU=0 \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
		TARGET="$(CATSFC_TARGET)" -C $(@D) all
endef

define CATSFC_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(CATSFC_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(CATSFC_TARGET)
endef

$(eval $(generic-package))
