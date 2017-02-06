//
//  SYAppDelegate.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYAppDelegate.h"

@implementation SYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBarController *tc = (UITabBarController *)self.window.rootViewController;
    [tc.tabBar setTintColor:[UIColor whiteColor]];
    [tc.tabBar setBarTintColor:[UIColor darkGrayColor]];
    return YES;
}
							
@end
