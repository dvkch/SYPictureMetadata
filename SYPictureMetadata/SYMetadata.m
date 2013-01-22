//
//  SYMetadata.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>
#import "SYMetadata.h"

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


@interface SYMetadata (Private)
-(void)refresh:(BOOL)force;
@end

@implementation SYMetadata

#pragma mark - Initialization

-(SYMetadata*)initWithMetadataDictionary:(NSDictionary*)metadata
{
    if(self = [super init])
    {
        self->_asset = nil;
        self->_assetURL = nil;
        self->_absolutePathURL = nil;
        self->_metadata = metadata;
        [self refresh:NO];
    }
    return self;
}

-(SYMetadata*)initWithAsset:(ALAsset *)asset
{
    if(self = [super init])
    {
        self->_asset = asset;
        self->_assetURL = nil;
        self->_absolutePathURL = nil;
        self->_metadata = nil;
        [self refresh:NO];
    }
    return self;
}

-(SYMetadata*)initWithAssetURL:(NSURL*)assetURL
{
    if(self = [super init])
    {
        self->_asset = nil;
        self->_assetURL = assetURL;
        self->_absolutePathURL = nil;
        self->_metadata = nil;
        [self refresh:NO];
    }
    return self;
}

-(SYMetadata *)initWithAbsolutePathURL:(NSURL *)absolutePathURL
{
    if(self = [super init])
    {
        self->_asset = nil;
        self->_assetURL = nil;
        self->_absolutePathURL = absolutePathURL;
        self->_metadata = nil;
        [self refresh:NO];
    }
    return self;
}

#pragma mark - Public methods

-(NSDictionary*)allMetadatas
{
    return self->_metadata;
}

-(SYMetadataTIFF *)metadataTiff
{
    return [[SYMetadataTIFF alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyTIFFDictionary]];
}

-(SYMetadataExif *)metadataExif
{
    return [[SYMetadataExif alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyExifDictionary]];
}

-(SYMetadataGIF*)metadataGIF
{
    return [[SYMetadataGIF alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary]];
}

-(SYMetadataJFIF*)metadataJFIF
{
    return [[SYMetadataJFIF alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyJFIFDictionary]];
}

-(SYMetadataPNG*)metadataPNG
{
    return [[SYMetadataPNG alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyPNGDictionary]];
}

-(SYMetadataIPTC*)metadataIPTC
{
    return [[SYMetadataIPTC alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyIPTCDictionary]];
}

-(SYMetadataGPS*)metadataGPS
{
    return [[SYMetadataGPS alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyGPSDictionary]];
}

-(SYMetadataRaw*)metadataRaw
{
    return [[SYMetadataRaw alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyRawDictionary]];
}

-(SYMetadataCIFF*)metadataCIFF
{
    return [[SYMetadataCIFF alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyCIFFDictionary]];
}

-(SYMetadataMakerCanon*)metadataMakerCanon
{
    return [[SYMetadataMakerCanon alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerCanonDictionary]];
}

-(SYMetadataMakerNikon*)metadataMakerNikon
{
    return [[SYMetadataMakerNikon alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerNikonDictionary]];
}

#warning iOS SDK doesn't seem to have definition for this key....
/*
-(SYMetadataMakerMinolta*)metadataMakerMinolta
{
    return [[SYMetadataMakerMinolta alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerMinoltaDictionary]];
}
*/

#warning iOS SDK doesn't seem to have definition for this key....
/*
-(SYMetadataMakerFuji*)metadataMakerFuji
{
    return [[SYMetadataMakerFuji alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerFujiDictionary]];
}
*/

#warning iOS SDK doesn't seem to have definition for this key....
/*
-(SYMetadataMakerOlympus*)metadataMakerOlympus
{
    return [[SYMetadataMakerOlympus alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerOlympusDictionary]];
}
*/

#warning iOS SDK doesn't seem to have definition for this key....
/*
-(SYMetadataMakerPentax*)metadataMakerPentax
{
    return [[SYMetadataMakerPentax alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyMakerPentaxDictionary]];
}
*/

-(SYMetadata8BIM*)metadata8BIM
{
    return [[SYMetadata8BIM alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImageProperty8BIMDictionary]];
}

-(SYMetadataDNG*)metadataDNG
{
    return [[SYMetadataDNG alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyDNGDictionary]];
}

-(SYMetadataExifAux*)metadataExifAux
{
    return [[SYMetadataExifAux alloc] initWithDic:[self->_metadata objectForKey:(__bridge NSString *)kCGImagePropertyExifAuxDictionary]];
}



#pragma mark - Private methods

-(void)refresh:(BOOL)force
{
    if(self->_metadata && !force)
        return;
    
    if(self->_asset)
    {
        ALAssetRepresentation *representation = [self->_asset defaultRepresentation];
        self->_metadata = [representation metadata];
    }
    else if(self->_assetURL)
    {
        __block ALAsset *assetAtUrl = nil;
        ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [library assetForURL:self->_assetURL resultBlock:^(ALAsset *asset) {
            assetAtUrl = asset;
            dispatch_semaphore_signal(sema);
        } failureBlock:^(NSError *error) {
            dispatch_semaphore_signal(sema);
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        if(!assetAtUrl)
            return;
        
        ALAssetRepresentation *representation = [assetAtUrl defaultRepresentation];
        self->_metadata = [representation metadata];
    }
    else if(self->_absolutePathURL)
    {
        CGImageSourceRef source = CGImageSourceCreateWithURL((__bridge CFURLRef)self->_absolutePathURL, NULL);
        if (source == NULL)
            return;
        
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], (NSString *)kCGImageSourceShouldCache, nil];
        CFDictionaryRef properties = CGImageSourceCopyPropertiesAtIndex(source, 0, (__bridge CFDictionaryRef)options);
        if (!properties) {
            CFRelease(source);
            return;
        }
        
        CFRelease(source);
        self->_metadata = (__bridge NSDictionary*)properties;
    }
    else
    {
        self->_metadata = nil;
    }
}

@end
