//
//  NSObject+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 03/03/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SYKit)

- (void)sy_performBlock:(void(^)(void))block onThread:(NSThread *)thread;
+ (void)sy_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector;
+ (BOOL)sy_instance:(id)instance overridesSelector:(SEL)selector;

- (NSString *)sy_className;
+ (NSString *)sy_className;

@end
