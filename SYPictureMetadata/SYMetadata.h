//
//  SYMetadata.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
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

@class ALAsset;

@interface SYMetadata : NSObject {
@private
    NSDictionary *_metadata;
    ALAsset *_asset;
    NSURL *_assetURL;
    NSURL* _absolutePathURL;
}

-(SYMetadata*)initWithAsset:(ALAsset*)asset;
-(SYMetadata*)initWithAssetURL:(NSURL*)assetURL;
-(SYMetadata*)initWithAbsolutePathURL:(NSURL*)absolutePathURL;

-(NSDictionary*)allMetadatas;

-(SYMetadataTIFF*)metadataTiff;
-(SYMetadataExif*)metadataExif;
-(SYMetadataGIF*)metadataGIF;
-(SYMetadataJFIF*)metadataJFIF;
-(SYMetadataPNG*)metadataPNG;
-(SYMetadataIPTC*)metadataIPTC;
-(SYMetadataGPS*)metadataGPS;
-(SYMetadataRaw*)metadataRaw;
-(SYMetadataCIFF*)metadataCIFF;
-(SYMetadataMakerCanon*)metadataMakerCanon;
-(SYMetadataMakerNikon*)metadataMakerNikon;
//-(SYMetadataMakerMinolta*)metadataMakerMinolta;
//-(SYMetadataMakerFuji*)metadataMakerFuji;
//-(SYMetadataMakerOlympus*)metadataMakerOlympus;
//-(SYMetadataMakerPentax*)metadataMakerPentax;
-(SYMetadata8BIM*)metadata8BIM;
-(SYMetadataDNG*)metadataDNG;
-(SYMetadataExifAux*)metadataExifAux;

@end
