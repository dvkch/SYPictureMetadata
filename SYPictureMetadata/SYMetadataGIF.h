//
//  SYMetadataGIF.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadataGIF : SYMetadataBase

@property (nonatomic, copy, readonly)   NSNumber                *loopCount;
@property (nonatomic, copy, readonly)   NSNumber                *delayTime;
@property (nonatomic, copy, readonly)   NSArray <NSNumber *>    *imageColorMap;
@property (nonatomic, copy, readonly)   NSNumber                *hasGlobalColorMap;
@property (nonatomic, copy, readonly)   NSNumber                *unclampedDelayTime;

@end
