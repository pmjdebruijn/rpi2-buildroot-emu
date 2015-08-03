################################################################################
#
# CATSFC
#
################################################################################
CATSFC_VERSION = 361b6927ef6af4e0913f18909cb841fd192e69d1
CATSFC_SITE = $(call github,libretro,CATSFC-libretro,$(CATSFC_VERSION))
CATSFC_TARGET = libcatsfc.so

define CATSFC_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
		CFLAGS="-I. -Isource $(TARGET_CFLAGS)" LD="$(TARGET_LD)" \
		TARGET="$(CATSFC_TARGET)" -C $(@D) all
endef

define CATSFC_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(CATSFC_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(CATSFC_TARGET)
endef

$(eval $(generic-package))
