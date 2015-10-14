################################################################################
#
# NESTOPIA
#
################################################################################
NESTOPIA_VERSION = f2aa87070ebac33081a03e8a3b8e12d2019b54d3
NESTOPIA_SITE = $(call github,libretro,nestopia,$(NESTOPIA_VERSION))
NESTOPIA_TARGET = libnestopia.so

define NESTOPIA_BUILD_CMDS
	$(MAKE) \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
		TARGET="$(NESTOPIA_TARGET)" -C $(@D)/libretro all
endef

define NESTOPIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/$(NESTOPIA_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(NESTOPIA_TARGET)
endef

$(eval $(generic-package))
