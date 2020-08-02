//
//  Config.h
//  NativeDisplayBrightness
//
//  Created by Volodymyr Klymenko on 1/29/18.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

#ifndef Config_h
#define Config_h

#include "AppDelegate.h"

#pragma mark - Key codes of special keys

#define APP_DELEGATE                ((AppDelegate *)[[NSApplication sharedApplication] delegate])

#define STATUS_ICON_WIDTH           24
#define STATUS_ICON_WIDTH_TEXT      52
#define STATUS_ICON_WIDTH_TEXT_100  58

// Extract from Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h
/* keycodes for keys that are independent of keyboard layout*/
enum {
    kVK_F2                        = 0x78,
    kVK_F1                        = 0x7A,
};


#pragma mark - constants

static NSString *const kDisplaysBrightnessDefaultsKey = @"displays-brightness";
static const int brightnessStepsCount = 16;
static const int brightnessSubstepsPerStep = 6;
static const int brightnessSubstepsCount = brightnessStepsCount * brightnessSubstepsPerStep;


#endif /* Config_h */
