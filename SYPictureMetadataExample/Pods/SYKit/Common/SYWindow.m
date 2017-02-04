//
//  SYWindow.m
//  TicTacDoh
//
//  Created by rominet on 12/12/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import "SYWindow.h"
#import "UIDevice+SYKit.h"

static CGFloat const SYWindow_DefaultAleternateAnimationSpeed = 0.05f;

@implementation SYWindow

+ (instancetype)mainWindowWithRootViewController:(UIViewController *)viewController
{
    SYWindow *window = [[SYWindow alloc] init];
    [window makeKeyAndVisible];
    
    // http://stackoverflow.com/questions/25963101/unexpected-nil-window-in-uiapplicationhandleeventfromqueueevent
    // The issue and solution described in the link above don't apply
    // for iOS 9+ screen spliting, an app started with a fraction of
    // the window would have the wrong frame. iOS uses the right frame
    // automatically
    
    if ([[UIDevice currentDevice] sy_iOSisLessThan:@"9.0"])
        [window setFrame:[[UIScreen mainScreen] bounds]];
    
    [window setRootViewController:viewController];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window.layer setMasksToBounds:YES];
    [window.layer setOpaque:NO];
    return window;
}

- (CGFloat)alternateAnimationSpeed
{
    if (_alternateAnimationSpeed == 0.)
        _alternateAnimationSpeed = SYWindow_DefaultAleternateAnimationSpeed;
    return _alternateAnimationSpeed;
}

- (void)toggleSlowAnimations
{
    if(self.layer.speed == 1) {
        NSLog(@"enabling slow animations");
        self.layer.speed = self.alternateAnimationSpeed;
    }
    else {
        NSLog(@"disabling slow animations");
        self.layer.speed = 1;
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionEnded:motion withEvent:event];
#if DEBUG
    if (!self.preventSlowAnimationsOnShake)
        [self toggleSlowAnimations];
#endif
}

@end
