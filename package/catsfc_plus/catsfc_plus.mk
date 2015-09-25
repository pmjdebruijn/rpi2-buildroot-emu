################################################################################
#
# CATSFC_PLUS
#
################################################################################
CATSFC_PLUS_VERSION = 64ffe869caba187b8c7205ad6182f5c603008128
CATSFC_PLUS_SITE = $(call github,libretro,CATSFC-libretro,$(CATSFC_PLUS_VERSION))
CATSFC_PLUS_TARGET = libcatsfc_plus.so

define CATSFC_PLUS_BUILD_CMDS
	$(MAKE) USE_BLARGG_APU=1 \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
		TARGET="$(CATSFC_PLUS_TARGET)" -C $(@D) all
endef

define CATSFC_PLUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(CATSFC_PLUS_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(CATSFC_PLUS_TARGET)
endef

$(eval $(generic-package))
