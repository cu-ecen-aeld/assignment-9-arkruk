
##############################################################
#
# AESD_CHAR_DRIVER
#
##############################################################

AESD_CHAR_DRIVER_VERSION = 773869d7355784c9c2960a229a4b7ab4ff04bd08
AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-arkruk.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES

AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver
AESD_CHAR_DRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))