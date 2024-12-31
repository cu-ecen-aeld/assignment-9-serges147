
##############################################################
#
# LDD
#
##############################################################

# Reference my assignment 7 git contents
LDD_VERSION = 'e3330d4a957158197d47a91ed0a1864c97a73c26'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-serges147.git'
LDD_SITE_METHOD = git
LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING

LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_SUBDIRS += scull

$(eval $(kernel-module))
$(eval $(generic-package))
