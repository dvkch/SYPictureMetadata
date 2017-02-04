//
//  SYMetadataBase.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"
#import <ImageIO/ImageIO.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000
// keys available on iOS 8+
CFStringRef const kCGImagePropertyAPNGLoopCount                 = CFSTR("LoopCount");
CFStringRef const kCGImagePropertyAPNGDelayTime                 = CFSTR("DelayTime");
CFStringRef const kCGImagePropertyAPNGUnclampedDelayTime        = CFSTR("UnclampedDelayTime");
CFStringRef const kCGImagePropertyGPSHPositioningError          = CFSTR("HPositioningError");
CFStringRef const kCGImageProperty8BIMVersion                   = CFSTR("Version");
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 90000
// keys available on iOS 9+
CFStringRef const kCGImagePropertyTIFFTileWidth                 = CFSTR("TileWidth");
CFStringRef const kCGImagePropertyTIFFTileLength                = CFSTR("TileLength");
CFStringRef const kCGImagePropertyPNGCompressionFilter          = CFSTR("kCGImagePropertyPNGCompressionFilter");
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 100000
// keys available on iOS 10+
CFStringRef const kCGImagePropertyDNGBlackLevel                 = CFSTR("BlackLevel");
CFStringRef const kCGImagePropertyDNGWhiteLevel                 = CFSTR("WhiteLevel");
CFStringRef const kCGImagePropertyDNGCalibrationIlluminant1     = CFSTR("CalibrationIlluminant1");
CFStringRef const kCGImagePropertyDNGCalibrationIlluminant2     = CFSTR("CalibrationIlluminant2");
CFStringRef const kCGImagePropertyDNGColorMatrix1               = CFSTR("ColorMatrix1");
CFStringRef const kCGImagePropertyDNGColorMatrix2               = CFSTR("ColorMatrix2");
CFStringRef const kCGImagePropertyDNGCameraCalibration1         = CFSTR("CameraCalibration1");
CFStringRef const kCGImagePropertyDNGCameraCalibration2         = CFSTR("CameraCalibration2");
CFStringRef const kCGImagePropertyDNGAsShotNeutral              = CFSTR("AsShotNeutral");
CFStringRef const kCGImagePropertyDNGAsShotWhiteXY              = CFSTR("AsShotWhiteXY");
CFStringRef const kCGImagePropertyDNGBaselineExposure           = CFSTR("BaselineExposure");
CFStringRef const kCGImagePropertyDNGBaselineNoise              = CFSTR("BaselineNoise");
CFStringRef const kCGImagePropertyDNGBaselineSharpness          = CFSTR("BaselineSharpness");
CFStringRef const kCGImagePropertyDNGPrivateData                = CFSTR("DNGPrivateData");
CFStringRef const kCGImagePropertyDNGCameraCalibrationSignature = CFSTR("CameraCalibrationSignature");
CFStringRef const kCGImagePropertyDNGProfileCalibrationSignature= CFSTR("ProfileCalibrationSignature");
CFStringRef const kCGImagePropertyDNGNoiseProfile               = CFSTR("NoiseProfile");
CFStringRef const kCGImagePropertyDNGWarpRectilinear            = CFSTR("WarpRectilinear");
CFStringRef const kCGImagePropertyDNGWarpFisheye                = CFSTR("WarpFisheye");
CFStringRef const kCGImagePropertyDNGFixVignetteRadial          = CFSTR("FixVignetteRadial");
#endif

// not defined in ImageIO
CFStringRef const kSYImagePropertyPictureStyle                  = CFSTR("{PictureStyle}");
CFStringRef const kSYImagePropertyExifAuxAutoFocusInfo          = CFSTR("AFInfo");
CFStringRef const kSYImagePropertyExifAuxImageStabilization     = CFSTR("ImageStabilization");
CFStringRef const kSYImagePropertyCIFFMaxAperture               = CFSTR("MaxAperture");
CFStringRef const kSYImagePropertyCIFFMinAperture               = CFSTR("MinAperture");
CFStringRef const kSYImagePropertyCIFFUniqueModelID             = CFSTR("UniqueModelID");

@implementation SYMetadataBase

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    // default transformer to prevents NSNull in generated dictionary
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    }];
}

- (NSDictionary *)generatedDictionary
{
    NSError *error;
    NSMutableDictionary *dictionary = [[MTLJSONAdapter JSONDictionaryFromModel:self error:&error] mutableCopy];
    
    if (error)
        NSLog(@"--> Error for class %@: %@", NSStringFromClass(self.class), error);
    
    [dictionary removeObjectsForKeys:[dictionary allKeysForObject:[NSNull null]]];
    return [dictionary copy];
}

@end

@implementation MTLValueTransformer (SY)

+ (instancetype)sy_nonZeroIntegerValueTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value integerValue] == 0)
            return nil;
        return value;
    }];
}

@end

