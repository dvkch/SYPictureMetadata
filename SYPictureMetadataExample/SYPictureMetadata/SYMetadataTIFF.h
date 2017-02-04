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

@property (readonly, nonatomic) NSNumber    *compression;
@property (readonly, nonatomic) NSNumber    *photometricInterpretation;
@property (readonly, nonatomic) NSString    *documentName;
@property (readonly, nonatomic) NSString    *imageDescription;
@property (readonly, nonatomic) NSString    *make;
@property (readonly, nonatomic) NSString    *model;
@property (readonly, nonatomic) NSNumber    *orientation;
@property (readonly, nonatomic) NSNumber    *xResolution;
@property (readonly, nonatomic) NSNumber    *yResolution;
@property (readonly, nonatomic) NSNumber    *resolutionUnit;
@property (readonly, nonatomic) NSString    *software;
@property (readonly, nonatomic) NSArray     *transferFunction;
@property (readonly, nonatomic) NSString    *dateTime;
@property (readonly, nonatomic) NSString    *artist;
@property (readonly, nonatomic) NSString    *hostComputer;
@property (readonly, nonatomic) NSString    *copyright;
@property (readonly, nonatomic) NSArray     *whitePoint;
@property (readonly, nonatomic) NSArray     *primaryChromaticities;

@end

