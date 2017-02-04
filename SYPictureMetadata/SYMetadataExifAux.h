//
//  SYMetadataExifAux.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadataExifAux : SYMetadataBase

@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *lensInfo;
@property (nonatomic, copy, readonly) NSString              *lensModel;
@property (nonatomic, copy, readonly) NSString              *serialNumber;
@property (nonatomic, copy, readonly) NSNumber              *lensID;
@property (nonatomic, copy, readonly) NSString              *lensSerialNumber;
@property (nonatomic, copy, readonly) NSNumber              *imageNumber;
@property (nonatomic, copy, readonly) NSObject              *flashCompensation;
@property (nonatomic, copy, readonly) NSString              *ownerName;
@property (nonatomic, copy, readonly) NSObject              *firmware;
@property (nonatomic, copy, readonly) NSNumber              *focusMode;
@property (nonatomic, copy, readonly) NSNumber              *focusDistance;
@property (nonatomic, copy, readonly) NSArray               *afInfo;
@property (nonatomic, copy, readonly) NSNumber              *imageStabilization;

@end
