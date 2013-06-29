TARGET = :clang

include theos/makefiles/common.mk

BUNDLE_NAME = Toggler
Toggler_FILES = $(wildcard *.m)
Toggler_INSTALL_PATH = /Library/WeeLoader/Plugins
Toggler_FRAMEWORKS = UIKit CoreGraphics
Toggler_LIBRARIES = flipswitch

#SUBPROJECTS = prefs

include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "spring"
