################################################################################
#
# Emulation Station
#
################################################################################
EMULATIONSTATION_VERSION = 1.0.2
EMULATIONSTATION_SOURCE = v$(EMULATIONSTATION_VERSION).tar.gz
EMULATIONSTATION_SITE = https://github.com/Aloshi/EmulationStation/archive
EMULATIONSTATION_LICENSE = MIT
EMULATIONSTATION_DEPENDENCIES = sdl boost libfreeimage freetype eigen alsa-lib \
	libgles

define EMULATIONSTATION_RPI_FIXUP
	$(SED) 's|/opt/vc/include|$(STAGING_DIR)/usr/include|g' $(@D)/CMakeLists.txt
	$(SED) 's|/opt/vc/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
endef

EMULATIONSTATION_PRE_CONFIGURE_HOOKS += EMULATIONSTATION_RPI_FIXUP

$(eval $(cmake-package))
