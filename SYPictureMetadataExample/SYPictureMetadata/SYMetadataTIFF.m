//
//  SYMetadataTIFF.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "SYMetadataTIFF.h"
#import <SYPair.h>

@implementation SYMetadataTIFF

+ (NSDictionary<NSString *,SYPair<NSString *,Class> *> *)mapping
{
    return @{SYStringSel(compression):              [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFCompression                  andObject:NSNumber.class],
             SYStringSel(photometricInterpretation):[SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFPhotometricInterpretation    andObject:NSNumber.class],
             SYStringSel(documentName):             [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFDocumentName                 andObject:NSString.class],
             SYStringSel(imageDescription):         [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFImageDescription             andObject:NSString.class],
             SYStringSel(make):                     [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFMake                         andObject:NSString.class],
             SYStringSel(model):                    [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFModel                        andObject:NSString.class],
             
             SYStringSel(orientation):              [SYPair pairWithObject:(NSString *)kCGImagePropertyOrientation                      andObject:NSNumber.class],
             SYStringSel(xResolution):              [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFXResolution                  andObject:NSNumber.class],
             SYStringSel(yResolution):              [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFYResolution                  andObject:NSNumber.class],
             SYStringSel(resolutionUnit):           [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFResolutionUnit               andObject:NSNumber.class],
             
             SYStringSel(software):                 [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFSoftware                     andObject:NSString.class],
             
             SYStringSel(transferFunction):         [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFTransferFunction             andObject:NSArray.class],
             
             SYStringSel(dateTime):                 [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFDateTime                     andObject:NSString.class],
             SYStringSel(artist):                   [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFArtist                       andObject:NSString.class],
             SYStringSel(hostComputer):             [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFHostComputer                 andObject:NSString.class],
             SYStringSel(copyright):                [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFCopyright                    andObject:NSString.class],
             
             SYStringSel(whitePoint):               [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFWhitePoint                   andObject:NSArray.class],
             SYStringSel(primaryChromaticities):    [SYPair pairWithObject:(NSString *)kCGImagePropertyTIFFPrimaryChromaticities        andObject:NSArray.class],
             };
}

@end
