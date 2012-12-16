//
//  SYMetadata.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SYMetadataExif;
@class SYMetadataTIFF;
@class SYMetadataGIF;
@class SYMetadataJFIF;
@class SYMetadataPNG;
@class SYMetadataIPTC;
@class SYMetadataGPS;
@class SYMetadataRaw;
@class SYMetadataCIFF;
@class SYMetadataMakerCanon;
@class SYMetadataMakerNikon;
@class SYMetadataMakerMinolta;
@class SYMetadataMakerFuji;
@class SYMetadataMakerOlympus;
@class SYMetadataMakerPentax;
@class SYMetadata8BIM;
@class SYMetadataDNG;
@class SYMetadataExifAux;

@interface SYMetadata : NSObject {
@private
    NSDictionary *_metadata;
    NSURL *_assetURL;
    NSString* _absolutePath;
}

-(SYMetadata*)initWithAssetURL:(NSURL*)assetURL;
-(SYMetadata*)initWithAbsolutePath:(NSString*)absolutePath;

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
