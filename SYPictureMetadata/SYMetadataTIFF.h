//
//  SYMetadataTIFF.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYMetadataBase.h"

typedef enum {
    SYPictureTiffOrientation_TopLeft = 1,
    SYPictureTiffOrientation_TopRight = 2,
    SYPictureTiffOrientation_BottomRight = 3,
    SYPictureTiffOrientation_BottomLeft = 4,
    SYPictureTiffOrientation_LeftTop = 5,
    SYPictureTiffOrientation_RightTop = 6,
    SYPictureTiffOrientation_RightBottom = 7,
    SYPictureTiffOrientation_LeftBottom = 8
} SYPictureTiffOrientation;


typedef enum {
    SYPictureTiffPhotometricInterpretation_MINISWHITE = 0,
    SYPictureTiffPhotometricInterpretation_MINISBLACK = 1,
    SYPictureTiffPhotometricInterpretation_RGB = 2,
    SYPictureTiffPhotometricInterpretation_PALETTE = 3,
    SYPictureTiffPhotometricInterpretation_MASK = 4,
    SYPictureTiffPhotometricInterpretation_SEPARATED = 5,
    SYPictureTiffPhotometricInterpretation_YCBCR = 6,
    SYPictureTiffPhotometricInterpretation_CIELAB = 8,
    SYPictureTiffPhotometricInterpretation_ICCLAB = 9,
    SYPictureTiffPhotometricInterpretation_ITULAB = 10,
    SYPictureTiffPhotometricInterpretation_LOGL = 32844,
    SYPictureTiffPhotometricInterpretation_LOGLUV = 32845
} SYPictureTiffPhotometricInterpretation;



@interface SYMetadataTIFF : SYMetadataBase

@property (readonly, nonatomic, getter = getCompression)                NSNumber*   compression;
@property (readonly, nonatomic, getter = getPhotometricInterpretation)  NSNumber*   photometricInterpretation;
@property (readonly, nonatomic, getter = getDocumentName)               NSString*   documentName;
@property (readonly, nonatomic, getter = getImageDescription)           NSString*   imageDescription;
@property (readonly, nonatomic, getter = getMake)                       NSString*   make;
@property (readonly, nonatomic, getter = getModel)                      NSString*   model;
@property (readonly, nonatomic, getter = getOrientation)                NSNumber*   orientation;
@property (readonly, nonatomic, getter = getXResolution)                NSNumber*   xResolution;
@property (readonly, nonatomic, getter = getYResolution)                NSNumber*   yResolution;
@property (readonly, nonatomic, getter = getResolutionUnit)             NSNumber*   resolutionUnit;
@property (readonly, nonatomic, getter = getSoftware)                   NSString*   software;
@property (readonly, nonatomic, getter = getTransferFunction)           NSArray*    transferFunction;
@property (readonly, nonatomic, getter = getDateTime)                   NSString*   dateTime;
@property (readonly, nonatomic, getter = getArtist)                     NSString*   artist;
@property (readonly, nonatomic, getter = getHostComputer)               NSString*   hostComputer;
@property (readonly, nonatomic, getter = getCopyright)                  NSString*   copyright;
@property (readonly, nonatomic, getter = getWhitePoint)                 NSArray*    whitePoint;
@property (readonly, nonatomic, getter = getPrimaryChromaticities)      NSArray*    primaryChromaticities;

@end

