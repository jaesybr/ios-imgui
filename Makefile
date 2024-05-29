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

#X2NIOSVN_LIBRARIES += substrate
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk

package::
    @echo "Packaging tweak..."
    $(ECHO_NOTHING)mkdir -p $(THEOS_PACKAGE_DIR)$(ECHO_END)
    $(ECHO_NOTHING)cp /home/gods6567/ios-imgui/.theos/obj/X2NIOSVN.deb $(THEOS_PACKAGE_DIR)/com.modmenu.x2nios_1.0_iphoneos-arm.deb$(ECHO_END)
