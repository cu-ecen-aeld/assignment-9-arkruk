
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

LDD_VERSION = 718cbdf07e082486e008537660e6b9fb4fb07a45
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-arkruk.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
    $(MAKE) -C $(@D)/misc-modules modules
	$(MAKE) -C $(@D)/scull modules
endef

define LDD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
