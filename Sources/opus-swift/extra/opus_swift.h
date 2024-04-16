#include <TargetConditionals.h>

#if TARGET_OS_IPHONE
    // should cover iOS, watchOS, tvOS and visionOS
    @import UIKit;
#elif TARGET_OS_MAC
    @import AppKit;
#endif

#include "opus.h"
