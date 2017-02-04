//
//  UIScreen+SYKit.h
//  SYKit
//
//  Created by Stanislas Chevallier on 07/07/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (SYKit)

- (CGRect)sy_boundsFixedToPortraitOrientation __TVOS_PROHIBITED;

- (CGRect)sy_screenRectForOrientation:(UIInterfaceOrientation)orientation
       showStatusBarOnIphoneLandscape:(BOOL)showStatusBarOnIphoneLandscape
              ignoreStatusBariOSOver7:(BOOL)ignoreStatusBariOSOver7 __TVOS_PROHIBITED;

@end
