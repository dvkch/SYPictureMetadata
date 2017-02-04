//
//  NSLayoutConstraint+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 14/09/2016.
//
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SYKit)

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                  attribute:(NSLayoutAttribute)attribute;

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                  attribute:(NSLayoutAttribute)attribute
                                     offset:(CGFloat)offset;

+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
                                 attribute1:(NSLayoutAttribute)attribute1
                                 attribute2:(NSLayoutAttribute)attribute2
                                     offset:(CGFloat)offset;

+ (instancetype)sy_constraintWithItems:(NSArray *)items
                             attribute:(NSLayoutAttribute)attribute
                             relatedBy:(NSLayoutRelation)relation
                                offset:(CGFloat)offset;

+ (instancetype)sy_constraintWithItems:(NSArray *)items
                            attribute1:(NSLayoutAttribute)attribute1
                            attribute2:(NSLayoutAttribute)attribute2
                             relatedBy:(NSLayoutRelation)relation
                                offset:(CGFloat)offset;

@end
