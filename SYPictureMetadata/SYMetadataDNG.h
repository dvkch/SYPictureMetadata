//
//  SYMetadataDNG.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

// https://www.adobe.com/content/dam/Adobe/en/products/photoshop/pdfs/dng_spec_1.4.0.0.pdf
@interface SYMetadataDNG : SYMetadataBase

@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *version;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *backwardVersion;
@property (nonatomic, copy, readonly) NSString              *uniqueCameraModel;
@property (nonatomic, copy, readonly) NSString              *localizedCameraModel;
@property (nonatomic, copy, readonly) NSString              *cameraSerialNumber;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *lensInfo;

@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *blackLevel;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *whiteLevel;
@property (nonatomic, copy, readonly) NSNumber              *calibrationIlluminant1;
@property (nonatomic, copy, readonly) NSNumber              *calibrationIlluminant2;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *colorMatrix1;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *colorMatrix2;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *cameraCalibration1;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *cameraCalibration2;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *asShotNeutral;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *asShotWhiteXY;
@property (nonatomic, copy, readonly) NSNumber              *baselineExposure;
@property (nonatomic, copy, readonly) NSNumber              *baselineNoise;
@property (nonatomic, copy, readonly) NSNumber              *baselineSharpness;
@property (nonatomic, copy, readonly) NSObject              *privateData;
@property (nonatomic, copy, readonly) NSString              *cameraCalibrationSignature;
@property (nonatomic, copy, readonly) NSString              *profileCalibrationSignature;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *noiseProfile;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *warpRectilinear;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *warpFisheye;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *fixVignetteRadial;

@end
