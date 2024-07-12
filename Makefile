export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
export FINALPACKAGE=1
export THEOS_DEVICE_IP=192.168.1.238

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AIOSpringboardTweak

AIOSpringboardTweak_FILES = Tweak.x
AIOSpringboardTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
