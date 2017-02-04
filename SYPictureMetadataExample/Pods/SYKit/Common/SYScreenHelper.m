//
//  SYScreenHelper.m
//  SYKit
//
//  Created by Stanislas Chevallier on 24/02/15.
//  Copyright (c) 2015 Syan. All rights reserved.
//

#import "SYScreenHelper.h"
#import "UIScreen+SYKit.h"
#import "UIDevice+SYKit.h"

NSString *NSStringFromUIInterfaceOrientation(UIInterfaceOrientation o)
{
    NSString *s = nil;
    switch (o) {
        case UIInterfaceOrientationPortrait:            s = @"UIInterfaceOrientationPortrait";          break;
        case UIInterfaceOrientationPortraitUpsideDown:  s = @"UIInterfaceOrientationPortraitUpsideDown";break;
        case UIInterfaceOrientationLandscapeLeft:       s = @"UIInterfaceOrientationLandscapeLeft";     break;
        case UIInterfaceOrientationLandscapeRight:      s = @"UIInterfaceOrientationLandscapeRight";    break;
        case UIInterfaceOrientationUnknown:             s = @"UIInterfaceOrientationUnknown";           break;
    }
    return s;
}

@implementation SYScreenHelper

+ (SYScreenHelper *)shared
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (BOOL)shouldShowStatusBarForOrientation:(UIInterfaceOrientation)orientation
{
    BOOL isPortrait = UIInterfaceOrientationIsPortrait(orientation);
    return [[UIDevice currentDevice] sy_isIpad] || (isPortrait || self.showStatusBarOnIphoneLandscape);
}

- (void)updateStatusBarVisibility:(UIInterfaceOrientation)orientation animated:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:![self shouldShowStatusBarForOrientation:orientation]
                                            withAnimation:(animated ? UIStatusBarAnimationSlide : UIStatusBarAnimationNone)];
}

- (CGRect)screenRect:(UIInterfaceOrientation)orientation
{
    return [[UIScreen mainScreen] sy_screenRectForOrientation:orientation
                               showStatusBarOnIphoneLandscape:self.showStatusBarOnIphoneLandscape
                                      ignoreStatusBariOSOver7:NO];
}

- (CGRect)fullScreenRect:(UIInterfaceOrientation)orientation
{
    return [[UIScreen mainScreen] sy_screenRectForOrientation:orientation
                               showStatusBarOnIphoneLandscape:self.showStatusBarOnIphoneLandscape
                                      ignoreStatusBariOSOver7:YES];
}

@end
