################################################################################
#
# SNES9X_NEXT
#
################################################################################
SNES9X_NEXT_VERSION = 7b3efe2f82637cdb56a2a951d0ee475e4b494660
SNES9X_NEXT_SITE = $(call github,libretro,snes9x-next,$(SNES9X_NEXT_VERSION))
SNES9X_NEXT_TARGET = libsnes9x-next.so

define SNES9X_NEXT_BUILD_CMDS
	$(MAKE) USE_BLARGG_APU=0 \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
		TARGET="$(SNES9X_NEXT_TARGET)" -C $(@D) all
endef

define SNES9X_NEXT_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(SNES9X_NEXT_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(SNES9X_NEXT_TARGET)
endef

$(eval $(generic-package))
