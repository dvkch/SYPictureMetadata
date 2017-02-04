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
#import "NSDictionary+SY.h"

#define SYKeyForMetadata(name)          NSStringFromSelector(@selector(metadata##name))
#define SYDictionaryForMetadata(name)   SYPaste(SYPaste(kCGImageProperty,name),Dictionary)
#define SYClassForMetadata(name)        SYPaste(SYMetadata,name)
#define SYMappingPptyToClass(name)      SYKeyForMetadata(name):SYClassForMetadata(name).class
#define SYMappingPptyToKeyPath(name)    SYKeyForMetadata(name):(__bridge NSString *)SYDictionaryForMetadata(name)

@interface SYMetadata (Private)
- (void)refresh:(BOOL)force;
@end

@implementation SYMetadata

#pragma mark - Initialization

+ (instancetype)metadataWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary)
        return nil;
    
    NSError *error;
    
    SYMetadata *instance = [MTLJSONAdapter modelOfClass:self.class fromJSONDictionary:dictionary error:&error];
    
    if (instance)
        instance->_originalDictionary = dictionary;
        
    if (error)
        NSLog(@"--> Error creating %@ object: %@", NSStringFromClass(self.class), error);
    
    return instance;
}

+ (instancetype)metadataWithAsset:(ALAsset *)asset
{
    ALAssetRepresentation *representation = [asset defaultRepresentation];

    SYMetadata *instance = [self metadataWithDictionary:[representation metadata]];
    if (instance)
        instance->_asset = asset;
    
    return instance;
}

+ (instancetype)metadataWithAssetURL:(NSURL *)assetURL
{
    NSDictionary *dictionary = [self dictionaryWithAssetURL:assetURL];
    if (!dictionary)
        return nil;
    
    SYMetadata *instance = [self metadataWithDictionary:dictionary];
    if (instance)
        instance->_assetURL = assetURL;
    
    return instance;
}

+ (instancetype)metadataWithFileURL:(NSURL *)fileURL
{
    if (!fileURL)
        return nil;
    
    CGImageSourceRef source = CGImageSourceCreateWithURL((__bridge CFURLRef)fileURL, NULL);
    if (source == NULL)
        return nil;
    
    NSDictionary *dictionary;
    
    NSDictionary *options = @{(NSString *)kCGImageSourceShouldCache:@(NO)};
    CFDictionaryRef properties = CGImageSourceCopyPropertiesAtIndex(source, 0, (__bridge CFDictionaryRef)options);
    if (properties) {
        dictionary = (__bridge NSDictionary*)properties;
    }
    
    CFRelease(source);
    
    SYMetadata *instance = [self metadataWithDictionary:dictionary];
    if (instance)
        instance->_fileURL = fileURL;
    
    return instance;
}

#pragma mark - Getting metadata

+ (NSDictionary *)dictionaryWithAssetURL:(NSURL *)assetURL
{
    __block ALAsset *assetAtUrl = nil;
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        assetAtUrl = asset;
        dispatch_semaphore_signal(sema);
    } failureBlock:^(NSError *error) {
        dispatch_semaphore_signal(sema);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    if (!assetAtUrl)
        return nil;
    
    ALAssetRepresentation *representation = [assetAtUrl defaultRepresentation];
    return [representation metadata];
}

#pragma mark - Mapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary <NSString *, NSString *> *mappings = [NSMutableDictionary dictionary];
    [mappings
     addEntriesFromDictionary:@{SYMappingPptyToKeyPath(TIFF),
                                SYMappingPptyToKeyPath(Exif),
                                SYMappingPptyToKeyPath(GIF),
                                SYMappingPptyToKeyPath(JFIF),
                                SYMappingPptyToKeyPath(PNG),
                                SYMappingPptyToKeyPath(IPTC),
                                SYMappingPptyToKeyPath(GPS),
                                SYMappingPptyToKeyPath(Raw),
                                SYMappingPptyToKeyPath(CIFF),
                                SYMappingPptyToKeyPath(MakerCanon),
                                SYMappingPptyToKeyPath(MakerNikon),
                                SYMappingPptyToKeyPath(MakerMinolta),
                                SYMappingPptyToKeyPath(MakerFuji),
                                SYMappingPptyToKeyPath(MakerOlympus),
                                SYMappingPptyToKeyPath(MakerPentax),
                                SYMappingPptyToKeyPath(8BIM),
                                SYMappingPptyToKeyPath(DNG),
                                SYMappingPptyToKeyPath(ExifAux),
                                }];
    
    [mappings
     addEntriesFromDictionary:@{SYStringSel(fileSize):      (NSString *)kCGImagePropertyFileSize,
                                SYStringSel(pixelHeight):   (NSString *)kCGImagePropertyPixelHeight,
                                SYStringSel(pixelWidth):    (NSString *)kCGImagePropertyPixelWidth,
                                SYStringSel(dpiHeight):     (NSString *)kCGImagePropertyDPIHeight,
                                SYStringSel(dpiWidth):      (NSString *)kCGImagePropertyDPIWidth,
                                SYStringSel(depth):         (NSString *)kCGImagePropertyDepth,
                                SYStringSel(orientation):   (NSString *)kCGImagePropertyOrientation,
                                SYStringSel(isFloat):       (NSString *)kCGImagePropertyIsFloat,
                                SYStringSel(isIndexed):     (NSString *)kCGImagePropertyIsIndexed,
                                SYStringSel(hasAlpha):      (NSString *)kCGImagePropertyHasAlpha,
                                SYStringSel(colorModel):    (NSString *)kCGImagePropertyColorModel,
                                SYStringSel(profileName):   (NSString *)kCGImagePropertyProfileName,
                                
                                SYStringSel(metadataApple):         (NSString *)kCGImagePropertyMakerAppleDictionary,
                                SYStringSel(metadataPictureStyle):  (NSString *)kSYImagePropertyPictureStyle,
                                }];
    
    return [mappings copy];
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    static dispatch_once_t onceToken;
    static NSDictionary <NSString *, Class> *classMappings;
    dispatch_once(&onceToken, ^{
        classMappings = @{SYMappingPptyToClass(TIFF),
                          SYMappingPptyToClass(Exif),
                          SYMappingPptyToClass(GIF),
                          SYMappingPptyToClass(JFIF),
                          SYMappingPptyToClass(PNG),
                          SYMappingPptyToClass(IPTC),
                          SYMappingPptyToClass(GPS),
                          SYMappingPptyToClass(Raw),
                          SYMappingPptyToClass(CIFF),
                          SYMappingPptyToClass(MakerCanon),
                          SYMappingPptyToClass(MakerNikon),
                          SYMappingPptyToClass(MakerMinolta),
                          SYMappingPptyToClass(MakerFuji),
                          SYMappingPptyToClass(MakerOlympus),
                          SYMappingPptyToClass(MakerPentax),
                          SYMappingPptyToClass(8BIM),
                          SYMappingPptyToClass(DNG),
                          SYMappingPptyToClass(ExifAux),
                          };
    });
    
    
    Class objectClass = classMappings[key];
    
    if (objectClass)
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:objectClass];
    
    return [super JSONTransformerForKey:key];
}

#pragma mark - Tests

+ (BOOL)testWithFileURL:(NSURL *)fileURL
{
    NSLog(@"---------------------------------");
    NSLog(@"Loading %@", fileURL.lastPathComponent);
    
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:fileURL];
    NSDictionary *diffs = [metadata differencesFromOriginalMetadataToModel];
    
    if (diffs.count)
        NSLog(@"Differences:\n%@", diffs);
    else
        NSLog(@"No differences");
    
    return (diffs.count == 0);
}

- (NSDictionary *)differencesFromOriginalMetadataToModel
{
    return [NSDictionary sy_differencesFrom:self.originalDictionary to:[self generatedDictionary]];
}

@end
