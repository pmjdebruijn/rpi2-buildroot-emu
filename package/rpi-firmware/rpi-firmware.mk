################################################################################
#
# rpi-firmware
#
################################################################################

RPI_FIRMWARE_VERSION = fc6c9896d26e9fb2cca9c024804f13938ee99311
RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
RPI_FIRMWARE_LICENSE = BSD-3c
RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
RPI_FIRMWARE_INSTALL_TARGET = NO
RPI_FIRMWARE_INSTALL_IMAGES = YES

RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware

define RPI_FIRMWARE_INSTALL_DTB
#	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/bcm2708-rpi-b.dtb
#	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/bcm2708-rpi-b-plus.dtb
	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/bcm2709-rpi-2-b.dtb
#	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
#		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/overlays/$${ovldtb##*/} || exit 1; \
#	done
endef

define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/bootcode.bin
	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/start.elf
	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/fixup.dat
	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/config.txt
	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/cmdline.txt
	$(RPI_FIRMWARE_INSTALL_DTB)
endef

# We have no host sources to get, since we already
# bundle the script we want to install.
HOST_RPI_FIRMWARE_SOURCE =
HOST_RPI_FIRMWARE_DEPENDENCIES =

define HOST_RPI_FIRMWARE_INSTALL_CMDS
	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
