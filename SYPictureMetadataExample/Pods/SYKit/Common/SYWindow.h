//
//  SYWindow.h
//  TicTacDoh
//
//  Created by rominet on 12/12/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYWindow : UIWindow

@property (atomic,    assign) BOOL    preventSlowAnimationsOnShake;
@property (nonatomic, assign) CGFloat alternateAnimationSpeed;

+ (instancetype)mainWindowWithRootViewController:(UIViewController *)viewController;

- (void)toggleSlowAnimations;

@end
