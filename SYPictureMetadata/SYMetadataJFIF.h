//
//  SYMetadataJFIF.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadataJFIF : SYMetadataBase

@property (nonatomic, copy,   readonly) NSArray     *version;
@property (nonatomic, copy,   readonly) NSNumber    *xDensity;
@property (nonatomic, copy,   readonly) NSNumber    *yDensity;
@property (nonatomic, copy,   readonly) NSNumber    *densityUnit;
@property (nonatomic, copy,   readonly) NSNumber    *isProgressive;

@end
