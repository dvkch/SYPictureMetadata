//
//  UIView+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 10/03/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "UIView+SYKit.h"
#import "NSObject+SYKit.h"
#import <objc/runtime.h>

@implementation UIView (SYKit)

@dynamic sy_tapInsets;

+ (void)sy_swizzlePointInside
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sy_swizzleSelector:@selector(pointInside:withEvent:)
                    withSelector:@selector(sy_pointInside:withEvent:)];
    });
}

- (void)setSy_tapInsets:(UIEdgeInsets)sy_tapInsets
{
    [[self class] sy_swizzlePointInside];
    
    NSValue *value = [NSValue valueWithUIEdgeInsets:sy_tapInsets];
    if (UIEdgeInsetsEqualToEdgeInsets(sy_tapInsets, UIEdgeInsetsZero))
        value = nil;
    
    objc_setAssociatedObject(self,
                             @selector(sy_tapInsets),
                             value,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)sy_tapInsets
{
    NSValue *value = objc_getAssociatedObject(self, @selector(sy_tapInsets));
    return [value UIEdgeInsetsValue];
}

- (BOOL)sy_pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSValue *insetsValue = objc_getAssociatedObject(self, @selector(sy_tapInsets));
    
    if (insetsValue && CGRectContainsPoint(UIEdgeInsetsInsetRect(self.bounds, insetsValue.UIEdgeInsetsValue), point))
        return YES;
    
    return [self sy_pointInside:point withEvent:event];
}

- (NSArray<UIView *> *)sy_findSubviewsOfClass:(Class)class recursive:(BOOL)recursive
{
    NSMutableArray <UIView *> *views = [NSMutableArray array];
    for (UIView *subview in self.subviews)
    {
        if (recursive)
            [views addObjectsFromArray:[subview sy_findSubviewsOfClass:class recursive:recursive]];
        
        if ([subview isKindOfClass:class])
            [views addObject:subview];
    }
    return [views copy];
}

@end
