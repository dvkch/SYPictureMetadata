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
#import "SYMetadataMakerCanon.h"
#import "SYMetadataMakerNikon.h"
#import "SYMetadataMakerMinolta.h"
#import "SYMetadataMakerFuji.h"
#import "SYMetadataMakerOlympus.h"
#import "SYMetadataMakerPentax.h"
#import "SYMetadata8BIM.h"
#import "SYMetadataDNG.h"
#import "SYMetadataExifAux.h"

// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/index.html
// http://www.exiv2.org/tags.html

@class ALAsset;

@interface SYMetadata : SYMetadataBase {
@private
    ALAsset         *_asset;
    NSURL           *_assetURL;
    NSURL           *_fileURL;
}

+ (instancetype)metadataWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)metadataWithAsset:(ALAsset *)asset;
+ (instancetype)metadataWithAssetURL:(NSURL *)assetURL;
+ (instancetype)metadataWithFileURL:(NSURL *)fileURL;

@property (nonatomic, copy, readonly) NSDictionary *originalDictionary;

@property (nonatomic, strong, readonly) SYMetadataTIFF          *metadataTIFF;
@property (nonatomic, strong, readonly) SYMetadataExif          *metadataExif;
@property (nonatomic, strong, readonly) SYMetadataGIF           *metadataGIF;
@property (nonatomic, strong, readonly) SYMetadataJFIF          *metadataJFIF;
@property (nonatomic, strong, readonly) SYMetadataPNG           *metadataPNG;
@property (nonatomic, strong, readonly) SYMetadataIPTC          *metadataIPTC;
@property (nonatomic, strong, readonly) SYMetadataGPS           *metadataGPS;
@property (nonatomic, strong, readonly) SYMetadataRaw           *metadataRaw;
@property (nonatomic, strong, readonly) SYMetadataCIFF          *metadataCIFF;
@property (nonatomic, strong, readonly) SYMetadataMakerCanon    *metadataMakerCanon;
@property (nonatomic, strong, readonly) SYMetadataMakerNikon    *metadataMakerNikon;
@property (nonatomic, strong, readonly) SYMetadataMakerMinolta  *metadataMakerMinolta;
@property (nonatomic, strong, readonly) SYMetadataMakerFuji     *metadataMakerFuji;
@property (nonatomic, strong, readonly) SYMetadataMakerOlympus  *metadataMakerOlympus;
@property (nonatomic, strong, readonly) SYMetadataMakerPentax   *metadataMakerPentax;
@property (nonatomic, strong, readonly) SYMetadata8BIM          *metadata8BIM;
@property (nonatomic, strong, readonly) SYMetadataDNG           *metadataDNG;
@property (nonatomic, strong, readonly) SYMetadataExifAux       *metadataExifAux;

// we don't know how to parse those, so we juste give access to them
@property (nonatomic, strong, readonly) NSDictionary *metadataApple;
@property (nonatomic, strong, readonly) NSDictionary *metadataPictureStyle;

@property (nonatomic, copy, readonly) NSNumber  *fileSize;
@property (nonatomic, copy, readonly) NSNumber  *pixelHeight;
@property (nonatomic, copy, readonly) NSNumber  *pixelWidth;
@property (nonatomic, copy, readonly) NSNumber  *dpiHeight;
@property (nonatomic, copy, readonly) NSNumber  *dpiWidth;
@property (nonatomic, copy, readonly) NSNumber  *depth;
@property (nonatomic, copy, readonly) NSNumber  *orientation;
@property (nonatomic, copy, readonly) NSNumber  *isFloat;
@property (nonatomic, copy, readonly) NSNumber  *isIndexed;
@property (nonatomic, copy, readonly) NSNumber  *hasAlpha;
@property (nonatomic, copy, readonly) NSString  *colorModel;
@property (nonatomic, copy, readonly) NSString  *profileName;

+ (BOOL)testWithFileURL:(NSURL *)fileURL;
- (NSDictionary *)differencesFromOriginalMetadataToModel;

@end
