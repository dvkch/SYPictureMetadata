//
//  NSObject+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 03/03/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "NSObject+SYKit.h"
#import <objc/runtime.h>

@implementation NSObject (SYKit)

- (void)sy_performBlock:(void(^)(void))block onThread:(NSThread *)thread
{
    if (thread == [NSThread currentThread])
    {
        if (block)
            block();
        return;
    }
    
    [self performSelector:@selector(sy_runBlock:) onThread:thread withObject:block waitUntilDone:NO];
}

- (void)sy_runBlock:(void(^)(void))block
{
    if (block)
        block();
}

+ (void)sy_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// http://stackoverflow.com/questions/28737116/check-if-subclass-overrides-a-method
+ (BOOL)sy_instance:(id)instance overridesSelector:(SEL)selector
{
    Class superClass = [instance superclass];
    BOOL isMethodOverridden = NO;
    
    while (superClass != Nil) {
        
        isMethodOverridden = ([superClass instancesRespondToSelector:selector] &&
                              ([instance methodForSelector:selector] !=
                               [superClass instanceMethodForSelector:selector]));
        
        if (isMethodOverridden)
            break;
        
        superClass = [superClass superclass];
    }
    
    return isMethodOverridden;
}

- (NSString *)sy_className
{
    return NSStringFromClass(self.class);
}
    
+ (NSString *)sy_className
{
    return NSStringFromClass(self.class);
}

@end
