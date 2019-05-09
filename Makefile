ARCHS = armv7 arm64 arm64e

TWEAK_NAME = TwitterDarkMode
TwitterDarkMode_FILES = Tweak.xm Follow.xm

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/tweak.mk

after-install::
	install.exec "killall -9 Twitter"
