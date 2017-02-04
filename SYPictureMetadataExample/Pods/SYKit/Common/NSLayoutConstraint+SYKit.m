//
//  NSLayoutConstraint+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 14/09/2016.
//
//

#import "NSLayoutConstraint+SYKit.h"

@implementation NSLayoutConstraint (SYKit)

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                  attribute:(NSLayoutAttribute)attribute
{
    return [self sy_constraintWithItems:items
                             attribute1:attribute
                             attribute2:attribute
                              relatedBy:NSLayoutRelationEqual
                                 offset:0];
}

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                  attribute:(NSLayoutAttribute)attribute
                                     offset:(CGFloat)offset
{
    return [self sy_constraintWithItems:items
                             attribute1:attribute
                             attribute2:attribute
                              relatedBy:NSLayoutRelationEqual
                                 offset:offset];
}

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                 attribute1:(NSLayoutAttribute)attribute1
                                 attribute2:(NSLayoutAttribute)attribute2
                                     offset:(CGFloat)offset
{
    return [self sy_constraintWithItems:items
                             attribute1:attribute1
                             attribute2:attribute2
                              relatedBy:NSLayoutRelationEqual
                                 offset:offset];
}

+ (instancetype)sy_constraintWithItems:(NSArray *)items
                             attribute:(NSLayoutAttribute)attribute
                             relatedBy:(NSLayoutRelation)relation
                                offset:(CGFloat)offset
{
    return [self sy_constraintWithItems:items
                             attribute1:attribute
                             attribute2:attribute
                              relatedBy:relation
                                 offset:offset];
}

+ (instancetype)sy_constraintWithItems:(NSArray *)items
                            attribute1:(NSLayoutAttribute)attribute1
                            attribute2:(NSLayoutAttribute)attribute2
                             relatedBy:(NSLayoutRelation)relation
                                offset:(CGFloat)offset
{
    NSAssert(items.count == 2, @"Two items needed to create this constraint");
    
    return [self constraintWithItem:items.firstObject
                          attribute:attribute1
                          relatedBy:relation
                             toItem:items.lastObject
                          attribute:attribute2
                         multiplier:1
                           constant:offset];
}

@end
