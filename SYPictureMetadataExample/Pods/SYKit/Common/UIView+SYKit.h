//
//  UIView+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 10/03/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYKit)

// override `pointInside:withEvent:` to "grow" your view touch areas outside of their natural bounds.
@property (nonatomic, assign) UIEdgeInsets sy_tapInsets;

// find all subviews of a given class
- (NSArray <UIView *> *)sy_findSubviewsOfClass:(Class)class recursive:(BOOL)recursive;

@end
