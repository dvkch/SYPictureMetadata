//
//  SYPicture.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>
#import "SYPicture.h"

@interface SYPicture (Private)
-(void)refresh;
@end

@implementation SYPicture

#pragma mark - Initialization

-(SYPicture*)initWithAssetURL:(NSURL*)assetURL
{
    if(self = [super init])
    {
        self->_assetURL = assetURL;
        self->_absolutePath = nil;
        self->_metadata = nil;
        [self refresh];
    }
    return self;
}

-(SYPicture*)initWithAbsolutePath:(NSString*)absolutePath
{
    if(self = [super init])
    {
        self->_assetURL = nil;
        self->_absolutePath = absolutePath;
        self->_metadata = nil;
        [self refresh];
    }
    return self;
}

#pragma mark - Public methods

-(SYPictureDictionaryTIFF *)metadataTiff
{
    return [[SYPictureDictionaryTIFF alloc] initWithDic:[self->_metadata objectForKey:(NSString*)kCGImagePropertyTIFFDictionary]];
}

-(SYPictureDictionaryEXIF *)metadataExif
{
    return [[SYPictureDictionaryEXIF alloc] initWithDic:[self->_metadata objectForKey:(NSString*)kCGImagePropertyExifDictionary]];
}

#pragma mark - Private methods

-(void)refresh
{
    if(self->_absolutePath)
    {
        CGImageSourceRef source = CGImageSourceCreateWithURL((__bridge CFURLRef)self->_absolutePath, NULL);
        if (source == NULL)
            return;
        
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], (NSString *)kCGImageSourceShouldCache, nil];
        CFDictionaryRef properties = CGImageSourceCopyPropertiesAtIndex(source, 0, (__bridge CFDictionaryRef)options);
        if (!properties)
            return;
        
        self->_metadata = (__bridge NSDictionary*)properties;
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
    else
    {
        self->_metadata = nil;
    }
}

@end
