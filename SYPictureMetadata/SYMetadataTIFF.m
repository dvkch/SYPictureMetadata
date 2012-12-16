//
//  SYMetadataTIFF.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "SYMetadataTIFF.h"

@implementation SYMetadataTIFF

-(NSNumber*)getCompression
{ return [self numberForKeyStringRef:kCGImagePropertyTIFFCompression]; }

-(NSNumber *)getPhotometricInterpretation
{ return [self numberForKeyStringRef:kCGImagePropertyTIFFPhotometricInterpretation]; }

-(NSString *)getDocumentName
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFDocumentName]; }

-(NSString *)getImageDescription
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFImageDescription]; }

-(NSString *)getMake
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFMake]; }

-(NSString *)getModel
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFModel]; }

-(NSNumber *)getOrientation
{ return [self numberForKeyStringRef:kCGImagePropertyTIFFOrientation]; }

-(NSArray *)getXResolution
{ return [self arrayForKeyStringRef:kCGImagePropertyTIFFXResolution]; }

-(NSArray *)getYResolution
{ return [self arrayForKeyStringRef:kCGImagePropertyTIFFYResolution]; }

-(NSNumber *)getResolutionUnit
{ return [self numberForKeyStringRef:kCGImagePropertyTIFFResolutionUnit]; }

-(NSString *)getSoftware
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFSoftware]; }

-(NSArray *)getTransferFunction
{ return [self arrayForKeyStringRef:kCGImagePropertyTIFFTransferFunction]; }

-(NSString *)getDateTime
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFDateTime]; }

-(NSString *)getArtist
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFArtist]; }

-(NSString *)getHostComputer
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFHostComputer]; }

-(NSString *)getCopyright
{ return [self stringForKeyStringRef:kCGImagePropertyTIFFCopyright]; }

-(NSArray *)getWhitePoint
{ return [self arrayForKeyStringRef:kCGImagePropertyTIFFWhitePoint]; }

-(NSArray *)getPrimaryChromaticities
{ return [self arrayForKeyStringRef:kCGImagePropertyTIFFPrimaryChromaticities]; }

@end
