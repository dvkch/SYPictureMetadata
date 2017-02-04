//
//  SYMetadataTIFF.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYMetadataBase.h"

typedef enum {
    SYPictureTiffOrientation_Unknown        = 0,
    SYPictureTiffOrientation_TopLeft        = 1,
    SYPictureTiffOrientation_TopRight       = 2,
    SYPictureTiffOrientation_BottomRight    = 3,
    SYPictureTiffOrientation_BottomLeft     = 4,
    SYPictureTiffOrientation_LeftTop        = 5,
    SYPictureTiffOrientation_RightTop       = 6,
    SYPictureTiffOrientation_RightBottom    = 7,
    SYPictureTiffOrientation_LeftBottom     = 8,
} SYPictureTiffOrientation;


typedef enum {
    SYPictureTiffPhotometricInterpretation_MINISWHITE   = 0,
    SYPictureTiffPhotometricInterpretation_MINISBLACK   = 1,
    SYPictureTiffPhotometricInterpretation_RGB          = 2,
    SYPictureTiffPhotometricInterpretation_PALETTE      = 3,
    SYPictureTiffPhotometricInterpretation_MASK         = 4,
    SYPictureTiffPhotometricInterpretation_SEPARATED    = 5,
    SYPictureTiffPhotometricInterpretation_YCBCR        = 6,
    SYPictureTiffPhotometricInterpretation_CIELAB       = 8,
    SYPictureTiffPhotometricInterpretation_ICCLAB       = 9,
    SYPictureTiffPhotometricInterpretation_ITULAB       = 10,
    SYPictureTiffPhotometricInterpretation_LOGL         = 32844,
    SYPictureTiffPhotometricInterpretation_LOGLUV       = 32845,
} SYPictureTiffPhotometricInterpretation;



@interface SYMetadataTIFF : SYMetadataBase

@property (nonatomic, copy,   readonly) NSNumber    *compression;
@property (nonatomic, assign, readonly) SYPictureTiffPhotometricInterpretation  photometricInterpretation;
@property (nonatomic, copy,   readonly) NSString    *documentName;
@property (nonatomic, copy,   readonly) NSString    *imageDescription;
@property (nonatomic, copy,   readonly) NSString    *make;
@property (nonatomic, copy,   readonly) NSString    *model;
@property (nonatomic, assign, readonly) NSNumber    *orientation;
@property (nonatomic, copy,   readonly) NSNumber    *xResolution;
@property (nonatomic, copy,   readonly) NSNumber    *yResolution;
@property (nonatomic, copy,   readonly) NSNumber    *resolutionUnit;
@property (nonatomic, copy,   readonly) NSString    *software;
@property (nonatomic, copy,   readonly) NSArray     *transferFunction;
@property (nonatomic, copy,   readonly) NSString    *dateTime;
@property (nonatomic, copy,   readonly) NSString    *artist;
@property (nonatomic, copy,   readonly) NSString    *hostComputer;
@property (nonatomic, copy,   readonly) NSString    *copyright;
@property (nonatomic, copy,   readonly) NSArray     *whitePoint;
@property (nonatomic, copy,   readonly) NSArray     *primaryChromaticities;
@property (nonatomic, copy,   readonly) NSNumber    *tileWidth;
@property (nonatomic, copy,   readonly) NSNumber    *tileLength;

@end

