//
//  SYMetadataExifAux.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c 2012 Syan. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "SYMetadataExifAux.h"

@implementation SYMetadataExifAux

- (NSArray *)getLensInfo
{ return [self arrayForKeyStringRef:kCGImagePropertyExifAuxLensInfo]; }

- (NSString *)getLensModel
{ return [self stringForKeyStringRef:kCGImagePropertyExifAuxLensModel]; }

- (NSString *)getSerialNumber
{ return [self stringForKeyStringRef:kCGImagePropertyExifAuxSerialNumber]; }

- (NSNumber *)getLensID
{ return [self numberForKeyStringRef:kCGImagePropertyExifAuxLensID]; }

- (NSString *)getLensSerialNumber
{ return [self stringForKeyStringRef:kCGImagePropertyExifAuxLensSerialNumber]; }

- (NSNumber *)getImageNumber
{ return [self numberForKeyStringRef:kCGImagePropertyExifAuxImageNumber]; }

- (NSObject *)getFlashCompensation
{ return [self objectForKeyStringRef:kCGImagePropertyExifAuxFlashCompensation]; }

- (NSString *)getOwnerName
{ return [self stringForKeyStringRef:kCGImagePropertyExifAuxOwnerName]; }

- (NSObject *)getFirmware
{ return [self objectForKeyStringRef:kCGImagePropertyExifAuxFirmware]; }

@end
