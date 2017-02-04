//
//  SYScreenHelper.h
//  SYKit
//
//  Created by Stanislas Chevallier on 24/02/15.
//  Copyright (c) 2015 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringFromUIInterfaceOrientation(UIInterfaceOrientation o) __TVOS_PROHIBITED;

__TVOS_PROHIBITED
@interface SYScreenHelper : NSObject

+ (SYScreenHelper *)shared;

@property (nonatomic, assign) BOOL showStatusBarOnIphoneLandscape;

- (void)updateStatusBarVisibility:(UIInterfaceOrientation)orientation animated:(BOOL)animated;

// has offset (origin.y != 0) on iOS >= 7
- (CGRect)screenRect:(UIInterfaceOrientation)orientation;

 // ignores status bar
- (CGRect)fullScreenRect:(UIInterfaceOrientation)orientation;

@end

