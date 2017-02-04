//
//  UIScreen+SYKit.m
//  SYKit
//
//  Created by Stanislas Chevallier on 07/07/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import "UIScreen+SYKit.h"
#import "UIDevice+SYKit.h"

@implementation UIScreen (SYKit)

- (CGRect)sy_boundsFixedToPortraitOrientation
{
    if ([self respondsToSelector:@selector(fixedCoordinateSpace)])
    {
        return [self.coordinateSpace convertRect:self.bounds
                               toCoordinateSpace:self.fixedCoordinateSpace];
    }
    return self.bounds;
}

- (CGRect)sy_screenRectForOrientation:(UIInterfaceOrientation)orientation
       showStatusBarOnIphoneLandscape:(BOOL)showStatusBarOnIphoneLandscape
              ignoreStatusBariOSOver7:(BOOL)ignoreStatusBariOSOver7
{
    BOOL isPortrait = UIInterfaceOrientationIsPortrait(orientation);
    BOOL showStatusBar = [[UIDevice currentDevice] sy_isIpad] || isPortrait || showStatusBarOnIphoneLandscape;
    
    CGFloat statusBarHeight = (showStatusBar ? 20 : 0);
    
    CGSize screenSize = [[UIScreen mainScreen] sy_boundsFixedToPortraitOrientation].size;
    CGFloat viewWidth  = isPortrait ? screenSize.width  : screenSize.height;
    CGFloat viewHeight = isPortrait ? screenSize.height : screenSize.width;
    
    if (![UIDevice sy_iOSis7Plus] || !ignoreStatusBariOSOver7)
        viewHeight -= statusBarHeight;
    
    BOOL noYOffset = ![UIDevice sy_iOSis7Plus] || ignoreStatusBariOSOver7;
    
    return CGRectMake(0, (noYOffset ? 0 : statusBarHeight), viewWidth, viewHeight);
}

@end
