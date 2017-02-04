//
//  SYMetadata.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYMetadataTIFF.h"
#import "SYMetadataGIF.h"
#import "SYMetadataJFIF.h"
#import "SYMetadataExif.h"
#import "SYMetadataPNG.h"
#import "SYMetadataIPTC.h"
#import "SYMetadataGPS.h"
#import "SYMetadataRaw.h"
#import "SYMetadataCIFF.h"
#import "SYMetadataMakerApple.h"
#import "SYMetadataMakerCanon.h"
#import "SYMetadataMakerNikon.h"
#import "SYMetadataMakerMinolta.h"
#import "SYMetadataMakerFuji.h"
#import "SYMetadataMakerOlympus.h"
#import "SYMetadataMakerPentax.h"
#import "SYMetadata8BIM.h"
#import "SYMetadataDNG.h"
#import "SYMetadataExifAux.h"

@class ALAsset;

@interface SYMetadata : NSObject {
@private
    NSDictionary *_metadata;
    ALAsset *_asset;
    NSURL *_assetURL;
    NSURL* _absolutePathURL;
}

- (SYMetadata*)initWithMetadataDictionary:(NSDictionary*)metadata;
- (SYMetadata*)initWithAsset:(ALAsset*)asset;
- (SYMetadata*)initWithAssetURL:(NSURL*)assetURL;
- (SYMetadata*)initWithAbsolutePathURL:(NSURL*)absolutePathURL;

- (NSDictionary*)allMetadatas;

@property (nonatomic, strong, readonly) SYMetadataTIFF          *metadataTIFF;
@property (nonatomic, strong, readonly) SYMetadataExif          *metadataExif;
@property (nonatomic, strong, readonly) SYMetadataGIF           *metadataGIF;
@property (nonatomic, strong, readonly) SYMetadataJFIF          *metadataJFIF;
@property (nonatomic, strong, readonly) SYMetadataPNG           *metadataPNG;
@property (nonatomic, strong, readonly) SYMetadataIPTC          *metadataIPTC;
@property (nonatomic, strong, readonly) SYMetadataGPS           *metadataGPS;
@property (nonatomic, strong, readonly) SYMetadataRaw           *metadataRaw;
@property (nonatomic, strong, readonly) SYMetadataCIFF          *metadataCIFF;
@property (nonatomic, strong, readonly) SYMetadataMakerApple    *metadataMakerApple;
@property (nonatomic, strong, readonly) SYMetadataMakerCanon    *metadataMakerCanon;
@property (nonatomic, strong, readonly) SYMetadataMakerNikon    *metadataMakerNikon;
@property (nonatomic, strong, readonly) SYMetadataMakerMinolta  *metadataMakerMinolta;
@property (nonatomic, strong, readonly) SYMetadataMakerFuji     *metadataMakerFuji;
@property (nonatomic, strong, readonly) SYMetadataMakerOlympus  *metadataMakerOlympus;
@property (nonatomic, strong, readonly) SYMetadataMakerPentax   *metadataMakerPentax;
@property (nonatomic, strong, readonly) SYMetadata8BIM          *metadata8BIM;
@property (nonatomic, strong, readonly) SYMetadataDNG           *metadataDNG;
@property (nonatomic, strong, readonly) SYMetadataExifAux       *metadataExifAux;

@end
