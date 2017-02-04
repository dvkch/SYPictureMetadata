//
//  SYMetadata.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>
#import "SYMetadata.h"
#import "SYPair.h"

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

#define SYKeyForMetadata(name)          NSStringFromSelector(@selector(metadata##name))
#define SYDictionaryForMetadata(name)   SYPaste(SYPaste(kCGImageProperty,name),Dictionary)
#define SYClassForMetadata(name)        SYPaste(SYMetadata,name)
#define SYMappingForMetadata(name)      [SYPair pairWithObject:(__bridge NSString *)SYDictionaryForMetadata(name) andObject:SYClassForMetadata(name).class]
#define SYKeyToMappingForMetadata(name) SYKeyForMetadata(name):SYMappingForMetadata(name)

@interface SYMetadata (Private)
- (void)refresh:(BOOL)force;
@end

@implementation SYMetadata

#pragma mark - Initialization

- (SYMetadata*)initWithMetadataDictionary:(NSDictionary*)metadata
{
    if (self = [super init])
    {
        self->_metadata = metadata;
        [self refresh:NO];
    }
    return self;
}

- (SYMetadata*)initWithAsset:(ALAsset *)asset
{
    if (self = [super init])
    {
        self->_asset = asset;
        [self refresh:NO];
    }
    return self;
}

- (SYMetadata*)initWithAssetURL:(NSURL*)assetURL
{
    if (self = [super init])
    {
        self->_assetURL = assetURL;
        [self refresh:NO];
    }
    return self;
}

- (SYMetadata *)initWithAbsolutePathURL:(NSURL *)absolutePathURL
{
    if (self = [super init])
    {
        self->_absolutePathURL = absolutePathURL;
        [self refresh:NO];
    }
    return self;
}

#pragma mark - Public methods

- (NSDictionary*)allMetadatas
{
    return self->_metadata;
}

- (NSDictionary <NSString *, SYPair <NSString *, Class> *> *)mappings
{
    static dispatch_once_t onceToken;
    static NSDictionary <NSString *, SYPair <NSString *, Class> *> *mappings;
    dispatch_once(&onceToken, ^
    {
        mappings = @{SYKeyToMappingForMetadata(TIFF),
                     SYKeyToMappingForMetadata(Exif),
                     SYKeyToMappingForMetadata(GIF),
                     SYKeyToMappingForMetadata(JFIF),
                     SYKeyToMappingForMetadata(PNG),
                     SYKeyToMappingForMetadata(IPTC),
                     SYKeyToMappingForMetadata(GPS),
                     SYKeyToMappingForMetadata(Raw),
                     SYKeyToMappingForMetadata(CIFF),
                     SYKeyToMappingForMetadata(MakerApple),
                     SYKeyToMappingForMetadata(MakerCanon),
                     SYKeyToMappingForMetadata(MakerNikon),
                     SYKeyToMappingForMetadata(MakerMinolta),
                     SYKeyToMappingForMetadata(MakerFuji),
                     SYKeyToMappingForMetadata(MakerOlympus),
                     SYKeyToMappingForMetadata(MakerPentax),
                     SYKeyToMappingForMetadata(8BIM),
                     SYKeyToMappingForMetadata(DNG),
                     SYKeyToMappingForMetadata(ExifAux),
                     };
    });
    return mappings;
}

- (id)valueForKey:(NSString *)key
{
    if ([[self mappings].allKeys containsObject:key])
    {
        SYPair <NSString *, Class> *mapping = self.mappings[key];
        NSDictionary *dictionary = [self->_metadata objectForKey:mapping.object1];
        
        NSError *error;
        id object = [MTLJSONAdapter modelOfClass:mapping.object2 fromJSONDictionary:dictionary error:&error];
        
        if (error)
            NSLog(@"--> %@", error);
        
        return object;
    }
    return [super valueForKey:key];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

#warning why is this needed ?
- (SYMetadataTIFF *)metadataTIFF
{
    return [self valueForKey:NSStringFromSelector(_cmd)];
}

#pragma mark - Private methods

- (void)refresh:(BOOL)force
{
    if (self->_metadata && !force)
        return;
    
    if (self->_asset)
    {
        ALAssetRepresentation *representation = [self->_asset defaultRepresentation];
        self->_metadata = [representation metadata];
    }
    else if (self->_assetURL)
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
        
        if (!assetAtUrl)
            return;
        
        ALAssetRepresentation *representation = [assetAtUrl defaultRepresentation];
        self->_metadata = [representation metadata];
    }
    else if (self->_absolutePathURL)
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
