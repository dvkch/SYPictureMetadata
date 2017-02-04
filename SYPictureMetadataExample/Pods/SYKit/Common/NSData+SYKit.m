//
//  NSData+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 14/03/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "NSData+SYKit.h"

@implementation NSData (SYKit)

// http://stackoverflow.com/questions/6824357/png-validation-on-ios
- (BOOL)sy_imageDataIsValidPNG
{
    if (self.length < 12)
        return NO;
    
    NSUInteger totalBytes = self.length;
    const uint8_t *bytes = (const uint8_t *)[self bytes];
    
    return (bytes[0] == (uint8_t)0x89 && // PNG
            bytes[1] == (uint8_t)0x50 &&
            bytes[2] == (uint8_t)0x4e &&
            bytes[3] == (uint8_t)0x47 &&
            bytes[4] == (uint8_t)0x0d &&
            bytes[5] == (uint8_t)0x0a &&
            bytes[6] == (uint8_t)0x1a &&
            bytes[7] == (uint8_t)0x0a &&
            
            bytes[totalBytes - 12] == (uint8_t)0x00 && // IEND
            bytes[totalBytes - 11] == (uint8_t)0x00 &&
            bytes[totalBytes - 10] == (uint8_t)0x00 &&
            bytes[totalBytes -  9] == (uint8_t)0x00 &&
            bytes[totalBytes -  8] == (uint8_t)0x49 &&
            bytes[totalBytes -  7] == (uint8_t)0x45 &&
            bytes[totalBytes -  6] == (uint8_t)0x4e &&
            bytes[totalBytes -  5] == (uint8_t)0x44 &&
            bytes[totalBytes -  4] == (uint8_t)0xae &&
            bytes[totalBytes -  3] == (uint8_t)0x42 &&
            bytes[totalBytes -  2] == (uint8_t)0x60 &&
            bytes[totalBytes -  1] == (uint8_t)0x82);
}

// http://stackoverflow.com/questions/9265343/imageio-error-jpeg-corrupt-jpeg-data-premature-end-of-data-segment-iphone/9990940#9990940
- (BOOL)sy_imageDataIsValidJPEG
{
    if (self.length < 4)
        return NO;
    
    NSUInteger totalBytes = self.length;
    const uint8_t *bytes = (const uint8_t *)[self bytes];
    
    return (bytes[0] == (uint8_t)0xFF &&
            bytes[1] == (uint8_t)0xD8 &&
            
            bytes[totalBytes - 2] == (uint8_t)0xFF &&
            bytes[totalBytes - 1] == (uint8_t)0xD9);
}

@end
