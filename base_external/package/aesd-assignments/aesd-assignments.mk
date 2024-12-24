
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Reference my assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '54db03c681695ebea0f15731c0a8e12ad4574337'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-serges147.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	@echo -e "\n>>>>>>>>>>>> Building 'finder-app'..."
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	@echo "<<<<<<<<<<<<<< 'finder-app' build complete."

	@echo -e "\n>>>>>>>>>>>> Building 'server'..."
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
	@echo "<<<<<<<<<<<<<< 'server' build complete."
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
