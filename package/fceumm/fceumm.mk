################################################################################
#
# FCEUMM
#
################################################################################
FCEUMM_VERSION = 1b91001c95c338140e3afc9f315cac1cef9627b5
FCEUMM_SITE = $(call github,libretro,libretro-fceumm,$(FCEUMM_VERSION))
FCEUMM_TARGET = libfceumm.so

define FCEUMM_BUILD_CMDS
	$(MAKE) -f Makefile.libretro \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
		TARGET="$(FCEUMM_TARGET)" -C $(@D) all
endef

define FCEUMM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(FCEUMM_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(FCEUMM_TARGET)
endef

$(eval $(generic-package))
