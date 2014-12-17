include theos/makefiles/common.mk


flweak_FRAMEWORKS = UIKit CoreGraphics
flweak_ARCHS = armv6 armv7 armv7s arm64

TWEAK_NAME = flweak
flweak_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

