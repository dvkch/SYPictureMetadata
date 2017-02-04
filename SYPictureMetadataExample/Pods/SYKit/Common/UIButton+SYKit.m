//
//  UIButton+SYKit.m
//  SYKit
//
//  Created by Stanislas Chevallier on 30/07/14.
//  Copyright (c) 2014 Syan. All rights reserved.
//

#import "UIButton+SYKit.h"
#import "UIImage+SYKit.h"

@implementation UIButton (SYKit)

-(void)sy_setButtonBackgroundColor:(UIColor *)buttonColor forState:(UIControlState)state {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1., 1.), YES, 0.0f);
    [buttonColor setFill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 1., 1.)] fill];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:img forState:state];
}

@end
