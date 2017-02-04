//
//  SYMetadataCIFF.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

// https://www.google.fr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwiz8M_F2_LRAhXEnBoKHR1cBZ0QFggcMAA&url=https%3A%2F%2Fraw.githubusercontent.com%2Fwiki%2Fdrewnoakes%2Fmetadata-extractor%2Fdocs%2FCIFFspecV1R04.pdf&usg=AFQjCNGnNxzUM-dlNVKR0UTnVAEr1NoqkA&sig2=XUuKb8H7O90Cbt3QLoZ3PQ

@interface SYMetadataCIFF : SYMetadataBase

@property (nonatomic, copy, readonly) NSString  *descr;
@property (nonatomic, copy, readonly) NSString  *firmware;
@property (nonatomic, copy, readonly) NSString  *ownerName;
@property (nonatomic, copy, readonly) NSString  *imageName;
@property (nonatomic, copy, readonly) NSString  *imageFileName;
@property (nonatomic, copy, readonly) NSNumber  *releaseMethod;
@property (nonatomic, copy, readonly) NSNumber  *releaseTiming;
@property (nonatomic, copy, readonly) NSNumber  *recordID;
@property (nonatomic, copy, readonly) NSNumber  *selfTimingTime;
@property (nonatomic, copy, readonly) NSNumber  *cameraSerialNumber;
@property (nonatomic, copy, readonly) NSNumber  *imageSerialNumber;
@property (nonatomic, copy, readonly) NSNumber  *continuousDrive;
@property (nonatomic, copy, readonly) NSNumber  *focusMode;
@property (nonatomic, copy, readonly) NSNumber  *meteringMode;
@property (nonatomic, copy, readonly) NSNumber  *shootingMode;
@property (nonatomic, copy, readonly) NSString  *lensModel;
@property (nonatomic, copy, readonly) NSNumber  *lensMaxMM;
@property (nonatomic, copy, readonly) NSNumber  *lensMinMM;
@property (nonatomic, copy, readonly) NSNumber  *whiteBalanceIndex;
@property (nonatomic, copy, readonly) NSNumber  *flashExposureComp;
@property (nonatomic, copy, readonly) NSNumber  *measuredEV;
@property (nonatomic, copy, readonly) NSNumber  *uniqueModelID;
@property (nonatomic, copy, readonly) NSNumber  *maxAperture;
@property (nonatomic, copy, readonly) NSNumber  *minAperture;

@end
