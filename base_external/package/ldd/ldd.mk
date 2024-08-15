
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

LDD_VERSION = f5019f866887ed84a1d47555b6c3a450a11c462d
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly  $(MAKE) -C $(@D)/misc-modules modules
#	$(MAKE) -C $(@D)/scull modules
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#    $(MAKE) -C '$(@D)/misc-modules' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules
#	$(MAKE) -C '$(@D)/scull' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-arkruk.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules
endef

$(eval $(kernel-module))
$(eval $(generic-package))