//
//  SYMetadataMakerCanon.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

typedef enum : NSUInteger {
   SYMetadataMakerCanonContinuousDriver_Single                  = 0,
   SYMetadataMakerCanonContinuousDriver_Continuous              = 1,
   SYMetadataMakerCanonContinuousDriver_Movie                   = 2,
   SYMetadataMakerCanonContinuousDriver_ContinuousSpeedPriority = 3,
   SYMetadataMakerCanonContinuousDriver_ContinuousLow           = 4,
   SYMetadataMakerCanonContinuousDriver_ContinuousHigh          = 5,
   SYMetadataMakerCanonContinuousDriver_SilentSingle            = 6,
   SYMetadataMakerCanonContinuousDriver_SingleSilent            = 9,
   SYMetadataMakerCanonContinuousDriver_ContinuousSilent        = 10,
} SYMetadataMakerCanonContinuousDriver;

@interface SYMetadataMakerCanon : SYMetadataBase

@property (nonatomic, copy, readonly) NSString  *ownerName;
@property (nonatomic, copy, readonly) NSNumber  *cameraSerialNumber;
@property (nonatomic, copy, readonly) NSNumber  *imageSerialNumber;
@property (nonatomic, copy, readonly) NSNumber  *flashExposureComp;
@property (nonatomic, copy, readonly) NSNumber  *continuousDrive;
@property (nonatomic, copy, readonly) NSString  *lensModel;
@property (nonatomic, copy, readonly) NSString  *firmware;
@property (nonatomic, copy, readonly) NSNumber  *aspectRatioInfo;
@property (nonatomic, copy, readonly) NSNumber  *whiteBalanceIndex;
@property (nonatomic, copy, readonly) NSNumber  *uniqueModelID;
@property (nonatomic, copy, readonly) NSNumber  *maxAperture;
@property (nonatomic, copy, readonly) NSNumber  *minAperture;

@end
