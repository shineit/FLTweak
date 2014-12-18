include theos/makefiles/common.mk



LocationTest_FRAMEWORKS =CoreLocation UIKit CoreGraphics

THEOS_DEVICE_IP = 192.168.2.219 #iphone6+
TARGET := iphone:7.0
ARCHS := armv7 arm64

TWEAK_NAME = LocationTest
LocationTest_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
