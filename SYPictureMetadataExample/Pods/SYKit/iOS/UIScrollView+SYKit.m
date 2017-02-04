//
//  UIScrollView+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 16/09/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "UIScrollView+SYKit.h"
#import "NSObject+SYKit.h"
#import <objc/runtime.h>
#import "JGMethodSwizzler.h"

@implementation UIScrollView (SYKit)

- (BOOL)sy_hasBeenSwizzled
{
    return [objc_getAssociatedObject(self, @selector(sy_hasBeenSwizzled)) boolValue];
}

- (void(^)(CGSize))sy_contentSizeChangedBlock
{
    return objc_getAssociatedObject(self, @selector(sy_contentSizeChangedBlock));
}

- (CGSize)sy_previousContentSize
{
    return [(NSValue *)objc_getAssociatedObject(self, @selector(sy_previousContentSize)) CGSizeValue];
}

- (void)sy_setPreviousContentSize:(CGSize)size
{
    objc_setAssociatedObject(self, @selector(sy_previousContentSize), [NSValue valueWithCGSize:size], OBJC_ASSOCIATION_RETAIN);
}

- (void)sy_setContentSizeChangedBlock:(void(^)(CGSize newSize))block
{
    if (![self sy_hasBeenSwizzled])
    {
        [self swizzleMethod:@selector(setContentSize:) withReplacement:JGMethodReplacementProviderBlock {
            return JGMethodReplacement(void, UIScrollView *, CGSize contentSize) {
                JGOriginalImplementation(void, contentSize);
                
                BOOL tellBlock = (!CGSizeEqualToSize([self sy_previousContentSize], contentSize));
                [self sy_setPreviousContentSize:contentSize];
                
                if (tellBlock && [self sy_contentSizeChangedBlock])
                    [self sy_contentSizeChangedBlock](contentSize);
            };
        }];
        
        objc_setAssociatedObject(self, @selector(sy_hasBeenSwizzled), @(YES), OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, @selector(sy_contentSizeChangedBlock), block, OBJC_ASSOCIATION_COPY);
}


@end
