//
//  UIImage+SYKit.h
//  SYKit
//
//  Created by rominet on 1/1/13.
//  Copyright (c) 2013 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SYKit)

- (BOOL)sy_hasAlpha;
- (UIImage *)sy_imageByAddingPaddingTop:(CGFloat)top
                                   left:(CGFloat)left
                                  right:(CGFloat)right
                                 bottom:(CGFloat)bottom;


- (UIImage *)sy_imageResizedTo:(CGSize)size;
- (UIImage *)sy_imageResizedSquarreTo:(CGFloat)size;
- (UIImage *)sy_imageResizedHeightTo:(CGFloat)height;
- (UIImage *)sy_imageResizedWidthTo:(CGFloat)width;

- (UIImage *)sy_imageWithToolbarButtonStyling;
- (UIImage *)sy_imageMaskedWithColor:(UIColor *)maskColor;
+ (UIImage *)sy_imageWithColor:(UIColor *)color;
+ (UIImage *)sy_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
- (UIImage *)sy_imageWithAngle:(CGFloat)angle;

+ (CGSize)sy_sizeOfImageAtURL:(NSURL *)url;

@end
