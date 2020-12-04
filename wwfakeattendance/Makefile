TARGET := iphone:clang:13.7:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WWFakeAttendance

WWFakeAttendance_FILES = Tweak.x
WWFakeAttendance_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
