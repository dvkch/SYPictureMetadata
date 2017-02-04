//
//  UIImage+SYKit.m
//  SYKit
//
//  Created by rominet on 1/1/13.
//  Copyright (c) 2013 Syan. All rights reserved.
//

#import "UIImage+SYKit.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (SYKit)

// https://github.com/mbcharbonneau/UIImage-Categories/blob/master/UIImage%2BAlpha.m
- (BOOL)sy_hasAlpha
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)sy_imageByAddingPaddingTop:(CGFloat)top
                                   left:(CGFloat)left
                                  right:(CGFloat)right
                                 bottom:(CGFloat)bottom
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width + left + right, self.size.height + top + bottom), NO, 0.0f);
    [self drawAtPoint:CGPointMake(left, top)];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

// http://www.lukaszielinski.de/blog/posts/2014/01/21/ios-how-to-resize-and-rotate-uiimages-in-a-thread-safe-fashion/
- (UIImage *)sy_imageResizedTo:(CGSize)size
{
    UIImage *newImage = nil;
    
    size_t targetWidth  = (size_t)(size.width  * self.scale);
    size_t targetHeight = (size_t)(size.height * self.scale);
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                targetWidth,
                                                targetHeight,
                                                CGImageGetBitsPerComponent(self.CGImage),
                                                4 * targetWidth,
                                                CGImageGetColorSpace(self.CGImage),
                                                CGImageGetAlphaInfo(self.CGImage));
    
    if (!bitmap)
        return nil;
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, targetWidth, targetHeight), self.CGImage);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    newImage = [UIImage imageWithCGImage:ref scale:self.scale orientation:self.imageOrientation];
    
    CGContextRelease(bitmap);
    
    return newImage;
}

- (UIImage *)sy_imageResizedSquarreTo:(CGFloat)size
{
    return [self sy_imageResizedTo:CGSizeMake(size, size)];
}

- (UIImage *)sy_imageResizedHeightTo:(CGFloat)height
{
    return [self sy_imageResizedTo:CGSizeMake(self.size.width * height / self.size.height, height)];
}

- (UIImage *)sy_imageResizedWidthTo:(CGFloat)width
{
    return [self sy_imageResizedTo:CGSizeMake(width, self.size.height * width / self.size.width)];
}

- (UIImage *)sy_imageWithToolbarButtonStyling
{
    float shadowOffset = 1;
    float shadowOpacity = .54f;
    CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect shadowRect = CGRectMake(0, shadowOffset, self.size.width, self.size.height);
    CGRect newRect = CGRectUnion(imageRect, shadowRect);
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -(newRect.size.height));
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, shadowRect, self.CGImage);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithWhite:0 alpha:shadowOpacity].CGColor);
    CGContextFillRect(ctx, shadowRect);
    CGContextRestoreGState(ctx);
    CGContextClipToMask(ctx, imageRect, self.CGImage);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithWhite:1 alpha:1].CGColor);
    CGContextFillRect(ctx, imageRect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)sy_imageMaskedWithColor:(UIColor *)maskColor
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
    CGContextClipToMask(context, imageRect, self.CGImage);
    CGContextSetFillColorWithColor(context, maskColor.CGColor);
    CGContextFillRect(context, imageRect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)sy_imageWithColor:(UIColor *)color
{
    return [self sy_imageWithColor:color size:CGSizeMake(1, 1) cornerRadius:0];
}

+ (UIImage *)sy_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = (CGRect){{0, 0}, size};
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillPath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

static inline CGFloat radians (CGFloat degrees) {return degrees * (CGFloat)M_PI/(CGFloat)180.;}

// https://github.com/cyclestreets/ios/blob/master/lib/utilities/NYXImagesUtilities.m
CGContextRef NYXImageCreateARGBBitmapContext(const size_t width, const size_t height, const size_t bytesPerRow);
CGContextRef NYXImageCreateARGBBitmapContext(const size_t width, const size_t height, const size_t bytesPerRow)
{
    /// Use the generic RGB color space
    /// We avoid the NULL check because CGColorSpaceRelease() NULL check the value anyway, and worst case scenario = fail to create context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    /// Create the bitmap context, we want pre-multiplied ARGB, 8-bits per component
    CGContextRef bmContext = CGBitmapContextCreate(NULL, width, height, 8/*Bits per component*/, bytesPerRow, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    
    CGColorSpaceRelease(colorSpace);
    
    return bmContext;
}

// http://www.lukaszielinski.de/blog/posts/2014/01/21/ios-how-to-resize-and-rotate-uiimages-in-a-thread-safe-fashion/
- (UIImage *)sy_imageWithAngle:(CGFloat)angle
{
    CGImageRef cgImage = self.CGImage;
    const CGFloat originalWidth  = CGImageGetWidth(cgImage);
    const CGFloat originalHeight = CGImageGetHeight(cgImage);
    
    const CGRect imgRect = (CGRect){
        .origin.x    = 0.0f,
        .origin.y    = 0.0f,
        .size.width  = originalWidth,
        .size.height = originalHeight};
    
    const CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, CGAffineTransformMakeRotation(radians(angle)));
    
    CGContextRef bmContext = NYXImageCreateARGBBitmapContext((size_t)rotatedRect.size.width, (size_t)rotatedRect.size.height, 0);
    if (!bmContext)
        return nil;
    
    CGContextSetShouldAntialias(bmContext, true);
    CGContextSetAllowsAntialiasing(bmContext, true);
    CGContextSetInterpolationQuality(bmContext, kCGInterpolationHigh);
    
    CGContextTranslateCTM(bmContext, +(rotatedRect.size.width * 0.5f), +(rotatedRect.size.height * 0.5f));
    CGContextRotateCTM(bmContext, radians(angle));
    
    CGContextDrawImage(bmContext, (CGRect){.origin.x = -originalWidth  * 0.5f,
        .origin.y = -originalHeight * 0.5f,
        .size.width  = originalWidth,
        .size.height = originalHeight}, cgImage);
    
    CGImageRef rotatedImageRef = CGBitmapContextCreateImage(bmContext);
    UIImage* rotated = [UIImage imageWithCGImage:rotatedImageRef];
    
    CGImageRelease(rotatedImageRef);
    CGContextRelease(bmContext);
    
    return rotated;
}

// http://oleb.net/blog/2011/09/accessing-image-properties-without-loading-the-image-into-memory/
+ (CGSize)sy_sizeOfImageAtURL:(NSURL *)url
{
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    
    if (imageSource == NULL)
        return CGSizeZero;
    
    CGSize imageSize = CGSizeZero;
    
    NSDictionary *options = @{(NSString *)kCGImageSourceShouldCache:@(NO)};
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, (CFDictionaryRef)options);
    if (imageProperties) {
        NSNumber *width = (NSNumber *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
        NSNumber *height = (NSNumber *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
        imageSize = CGSizeMake(width.integerValue, height.integerValue);
        CFRelease(imageProperties);
    }
    
    CFRelease(imageSource);
    return imageSize;
}

@end
