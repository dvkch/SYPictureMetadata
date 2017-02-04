//
//  SYMetadataMakerNikon.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

typedef enum : NSUInteger {
    SYMetadataMakerNikonShootingMode_Continuous             = 1 << 0L,
    SYMetadataMakerNikonShootingMode_Delay                  = 1 << 1L,
    SYMetadataMakerNikonShootingMode_PCControl              = 1 << 2L,
    SYMetadataMakerNikonShootingMode_Selftimer              = 1 << 3L,
    SYMetadataMakerNikonShootingMode_ExposureBracketing     = 1 << 4L,
    SYMetadataMakerNikonShootingMode_AutoISO                = 1 << 5L,
    SYMetadataMakerNikonShootingMode_WhiteBalanceBracketing = 1 << 6L,
    SYMetadataMakerNikonShootingMode_IRControl              = 1 << 7L,
    SYMetadataMakerNikonShootingMode_DLightingBracketing    = 1 << 8L,
} SYMetadataMakerNikonShootingMode;

typedef enum : NSUInteger {
    SYMetadataMakerNikonLensType_MF = 1 << 0L,
    SYMetadataMakerNikonLensType_D  = 1 << 1L,
    SYMetadataMakerNikonLensType_G  = 1 << 2L,
    SYMetadataMakerNikonLensType_VR = 1 << 3L,
} SYMetadataMakerNikonLensType;

@interface SYMetadataMakerNikon : SYMetadataBase

@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *isoSetting;
@property (nonatomic, copy, readonly) NSString              *colorMode;
@property (nonatomic, copy, readonly) NSString              *quality;
@property (nonatomic, copy, readonly) NSString              *whiteBalanceMode;
@property (nonatomic, copy, readonly) NSString              *sharpenMode;
@property (nonatomic, copy, readonly) NSString              *focusMode;
@property (nonatomic, copy, readonly) NSString              *flashSetting;
@property (nonatomic, copy, readonly) NSString              *isoSelection;
@property (nonatomic, copy, readonly) NSObject              *flashExposureComp;
@property (nonatomic, copy, readonly) NSString              *imageAdjustment;
@property (nonatomic, copy, readonly) NSObject              *lensAdapter;
@property (nonatomic, copy, readonly) NSNumber              *lensType;
@property (nonatomic, copy, readonly) NSObject              *lensInfo;
@property (nonatomic, copy, readonly) NSNumber              *focusDistance;
@property (nonatomic, copy, readonly) NSNumber              *digitalZoom;
@property (nonatomic, copy, readonly) NSNumber              *shootingMode;
@property (nonatomic, copy, readonly) NSString              *cameraSerialNumber;
@property (nonatomic, copy, readonly) NSNumber              *shutterCount;

@end
