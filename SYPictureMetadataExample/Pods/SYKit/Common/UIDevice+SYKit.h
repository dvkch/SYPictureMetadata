//
//  UIDevice+SYKit.h
//  SYKit
//
//  Created by Stanislas Chevallier on 07/07/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UIDeviceModelUnknown,
    UIDeviceModelSimulator32bits,
    UIDeviceModelSimulator64bits,
    UIDeviceModeliPodTouch1G,
    UIDeviceModeliPodTouch2G,
    UIDeviceModeliPodTouch3G,
    UIDeviceModeliPodTouch4G,
    UIDeviceModeliPodTouch5G,
    UIDeviceModeliPodTouch6G,
    UIDeviceModeliPhone,
    UIDeviceModeliPhone3G,
    UIDeviceModeliPhone3GS,
    UIDeviceModeliPhone4,
    UIDeviceModeliPhone4S,
    UIDeviceModeliPhone5,
    UIDeviceModeliPhone5C,
    UIDeviceModeliPhone5S,
    UIDeviceModeliPhone6,
    UIDeviceModeliPhone6Plus,
    UIDeviceModeliPhone6S,
    UIDeviceModeliPhone6SPlus,
    UIDeviceModeliPad1,
    UIDeviceModeliPad2,
    UIDeviceModeliPad3,
    UIDeviceModeliPad4,
    UIDeviceModeliPadAir,
    UIDeviceModeliPadAir2,
    UIDeviceModeliPadMini,
    UIDeviceModeliPadMini2,
    UIDeviceModeliPadMini3,
    UIDeviceModeliPadMini4,
    UIDeviceModeliPadPro,
    UIDeviceModelAppleTV2Gen,
    UIDeviceModelAppleTV3Gen,
    UIDeviceModelAppleTV3GenRevA,
    UIDeviceModelAppleTV4Gen,
} UIDeviceModel;

@interface UIDevice (SYKit)

+ (UIDeviceModel)sy_deviceModelFromHardwareString:(NSString *)value;
+ (UIDeviceModel)sy_deviceModelFromModelNumber:(NSString *)value;
- (UIDeviceModel)sy_deviceModel;

- (BOOL)sy_shouldSupportViewBlur;
- (BOOL)sy_isIpad;

- (NSString*)sy_systemVersionCached;

- (BOOL)sy_iOSisEqualTo:(NSString *)version;
- (BOOL)sy_iOSisGreaterThan:(NSString *)version;
- (BOOL)sy_iOSisGreaterThanOrEqualTo:(NSString *)version;
- (BOOL)sy_iOSisLessThan:(NSString *)version;

+ (BOOL)sy_iOSis6Plus;
+ (BOOL)sy_iOSis7Plus;
+ (BOOL)sy_iOSis8Plus;

@end
