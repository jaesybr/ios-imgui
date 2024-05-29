ARCHS = arm64

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = X2NIOSVN

X2NIOSVN_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

X2NIOSVN_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
X2NIOSVN_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

X2NIOSVN_FILES = ImGuiDrawView.mm $(wildcard Esp/*.mm) $(wildcard Esp/*.m) $(wildcard KittyMemory/*.cpp) $(wildcard KittyMemory/*.mm)

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	@echo "Packaging tweak..."
	$(ECHO_NOTHING)mkdir -p $(THEOS_PACKAGE_DIR)$(ECHO_END)
	$(ECHO_NOTHING)cp -r $(THEOS_OBJ_DIR)/$(TWEAK_NAME).deb $(THEOS_PACKAGE_DIR)$(ECHO_END)

all::
	$(MAKE) -C $(THEOS) package
