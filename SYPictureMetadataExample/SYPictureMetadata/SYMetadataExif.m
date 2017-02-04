//
//SYMetadataEXIF.m
//SYPictureMetadataExample
//
//Created by Stan Chevallier on 12/13/12.
//Copyright (c2012 Syan. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "SYMetadataEXIF.h"

@implementation SYMetadataExif

- (NSNumber *)getExposureTime
{ return [self numberForKeyStringRef:kCGImagePropertyExifExposureTime]; }

- (NSNumber *)getFNumber
{ return [self numberForKeyStringRef:kCGImagePropertyExifFNumber]; }

- (NSNumber *)getExposureProgram
{ return [self numberForKeyStringRef:kCGImagePropertyExifExposureProgram]; }

- (NSString *)getSpectralSensitivity
{ return [self stringForKeyStringRef:kCGImagePropertyExifSpectralSensitivity]; }

- (NSNumber *)getISOSpeedRatings
{ return [self numberForKeyStringRef:kCGImagePropertyExifISOSpeedRatings]; }

- (NSObject *)getOECF
{ return [self objectForKeyStringRef:kCGImagePropertyExifOECF]; }

- (NSArray *)getVersion
{ return [self arrayForKeyStringRef:kCGImagePropertyExifVersion]; }

- (NSString *)getDateTimeOriginal
{ return [self stringForKeyStringRef:kCGImagePropertyExifDateTimeOriginal]; }

- (NSString *)getDateTimeDigitized
{ return [self stringForKeyStringRef:kCGImagePropertyExifDateTimeDigitized]; }

- (NSArray *)getComponentsConfiguration
{ return [self arrayForKeyStringRef:kCGImagePropertyExifComponentsConfiguration]; }

- (NSNumber *)getCompressedBitsPerPixel
{ return [self numberForKeyStringRef:kCGImagePropertyExifCompressedBitsPerPixel]; }

- (NSNumber *)getShutterSpeedValue
{ return [self numberForKeyStringRef:kCGImagePropertyExifShutterSpeedValue]; }

- (NSNumber *)getApertureValue
{ return [self numberForKeyStringRef:kCGImagePropertyExifApertureValue]; }

- (NSNumber *)getBrightnessValue
{ return [self numberForKeyStringRef:kCGImagePropertyExifBrightnessValue]; }

- (NSNumber *)getExposureBiasValue
{ return [self numberForKeyStringRef:kCGImagePropertyExifExposureBiasValue]; }

- (NSNumber *)getMaxApertureValue
{ return [self numberForKeyStringRef:kCGImagePropertyExifMaxApertureValue]; }

- (NSNumber *)getSubjectDistance
{ return [self numberForKeyStringRef:kCGImagePropertyExifSubjectDistance]; }

- (NSNumber *)getMeteringMode
{ return [self numberForKeyStringRef:kCGImagePropertyExifMeteringMode]; }

- (NSNumber *)getLightSource
{ return [self numberForKeyStringRef:kCGImagePropertyExifLightSource]; }
- (NSNumber *)getFlash
{ return [self numberForKeyStringRef:kCGImagePropertyExifFlash]; }

- (NSNumber *)getFocalLength
{ return [self numberForKeyStringRef:kCGImagePropertyExifFocalLength]; }

- (NSArray *)getSubjectArea
{ return [self arrayForKeyStringRef:kCGImagePropertyExifSubjectArea]; }

- (NSObject *)getMakerNote
{ return [self stringForKeyStringRef:kCGImagePropertyExifMakerNote]; }

- (NSString *)getUserComment
{ return [self stringForKeyStringRef:kCGImagePropertyExifUserComment]; }

- (NSString *)getSubsecTime
{ return [self stringForKeyStringRef:kCGImagePropertyExifSubsecTime]; }

- (NSString *)getSubsecTimeOriginal
{ return [self stringForKeyStringRef:kCGImagePropertyExifSubsecTimeOrginal]; }

- (NSString *)getSubsecTimeDigitized
{ return [self stringForKeyStringRef:kCGImagePropertyExifSubsecTimeDigitized]; }

- (NSString *)getFlashPixVersion
{ return [self stringForKeyStringRef:kCGImagePropertyExifFlashPixVersion]; }

- (NSNumber *)getColorSpace
{ return [self numberForKeyStringRef:kCGImagePropertyExifColorSpace]; }

- (NSNumber *)getPixelXDimension
{ return [self numberForKeyStringRef:kCGImagePropertyExifPixelXDimension]; }

- (NSNumber *)getPixelYDimension
{ return [self numberForKeyStringRef:kCGImagePropertyExifPixelYDimension]; }

- (NSString *)getRelatedSoundFile
{ return [self stringForKeyStringRef:kCGImagePropertyExifRelatedSoundFile]; }

- (NSNumber *)getFlashEnergy
{ return [self numberForKeyStringRef:kCGImagePropertyExifFlashEnergy]; }

- (NSObject *)getSpatialFrequencyResponse
{ return [self stringForKeyStringRef:kCGImagePropertyExifSpatialFrequencyResponse]; }

- (NSNumber *)getFocalPlaneXResolution
{ return [self numberForKeyStringRef:kCGImagePropertyExifFocalPlaneXResolution]; }

- (NSNumber *)getFocalPlaneYResolution
{ return [self numberForKeyStringRef:kCGImagePropertyExifFocalPlaneYResolution]; }

- (NSNumber *)getFocalPlaneResolutionUnit
{ return [self numberForKeyStringRef:kCGImagePropertyExifFocalPlaneResolutionUnit]; }

- (NSArray *)getSubjectLocation
{ return [self arrayForKeyStringRef:kCGImagePropertyExifSubjectLocation]; }

- (NSNumber *)getExposureIndex
{ return [self numberForKeyStringRef:kCGImagePropertyExifExposureIndex]; }

- (NSNumber *)getSensingMethod
{ return [self numberForKeyStringRef:kCGImagePropertyExifSensingMethod]; }

- (NSObject *)getFileSource
{ return [self stringForKeyStringRef:kCGImagePropertyExifFileSource]; }

- (NSObject *)getSceneType
{ return [self stringForKeyStringRef:kCGImagePropertyExifSceneType]; }

- (NSArray *)getCFAPattern
{ return [self arrayForKeyStringRef:kCGImagePropertyExifCFAPattern]; }

- (NSNumber *)getCustomRendered
{ return [self numberForKeyStringRef:kCGImagePropertyExifCustomRendered]; }

- (NSNumber *)getExposureMode
{ return [self numberForKeyStringRef:kCGImagePropertyExifExposureMode]; }

- (NSNumber *)getWhiteBalance
{ return [self numberForKeyStringRef:kCGImagePropertyExifWhiteBalance]; }

- (NSNumber *)getDigitalZoomRatio
{ return [self numberForKeyStringRef:kCGImagePropertyExifDigitalZoomRatio]; }

- (NSNumber *)getFocalLenIn35mmFilm
{ return [self numberForKeyStringRef:kCGImagePropertyExifFocalLenIn35mmFilm]; }

- (NSNumber *)getSceneCaptureType
{ return [self numberForKeyStringRef:kCGImagePropertyExifSceneCaptureType]; }

- (NSNumber *)getGainControl
{ return [self numberForKeyStringRef:kCGImagePropertyExifGainControl]; }

- (NSNumber *)getContrast
{ return [self numberForKeyStringRef:kCGImagePropertyExifContrast]; }

- (NSNumber *)getSaturation
{ return [self numberForKeyStringRef:kCGImagePropertyExifSaturation]; }

- (NSNumber *)getSharpness
{ return [self numberForKeyStringRef:kCGImagePropertyExifSharpness]; }

- (NSObject *)getDeviceSettingDescription
{ return [self stringForKeyStringRef:kCGImagePropertyExifDeviceSettingDescription]; }

- (NSNumber *)getSubjectDistRange
{ return [self numberForKeyStringRef:kCGImagePropertyExifSubjectDistRange]; }

- (NSString *)getImageUniqueID
{ return [self stringForKeyStringRef:kCGImagePropertyExifImageUniqueID]; }

- (NSString *)getCameraOwnerName
{ return [self stringForKeyStringRef:kCGImagePropertyExifCameraOwnerName]; }

- (NSString *)getBodySerialNumber
{ return [self stringForKeyStringRef:kCGImagePropertyExifBodySerialNumber]; }

- (NSArray *)getLensSpecification
{ return [self arrayForKeyStringRef:kCGImagePropertyExifLensSpecification]; }

- (NSString *)getLensMake
{ return [self stringForKeyStringRef:kCGImagePropertyExifLensMake]; }

- (NSString *)getLensModel
{ return [self stringForKeyStringRef:kCGImagePropertyExifLensModel]; }

- (NSString *)getLensSerialNumber
{ return [self stringForKeyStringRef:kCGImagePropertyExifLensSerialNumber]; }

- (NSNumber *)getGamma
{ return [self numberForKeyStringRef:kCGImagePropertyExifGamma]; }


- (NSString *)getFlashString
{
    NSNumber *flash = [self getFlash];
    NSString *flashString = @"Unknown";
    switch ([flash integerValue]) {
        case 0x0000:
            flashString = @"Flash did not fire";
            break;
        case 0x0001:
            flashString = @"Flash fired";
            break;
        case 0x0005:
            flashString = @"Strobe return light not detected";
            break;
        case 0x0007:
            flashString = @"Strobe return light detected";
            break;
        case 0x0009:
            flashString = @"Flash fired, compulsory flash mode";
            break;
        case 0x000D:
            flashString = @"Flash fired, compulsory flash mode, return light not detected";
            break;
        case 0x000F:
            flashString = @"Flash fired, compulsory flash mode, return light detected";
            break;
        case 0x0010:
            flashString = @"Flash did not fire, compulsory flash mode";
            break;
        case 0x0018:
            flashString = @"Flash did not fire, auto mode";
            break;
        case 0x0019:
            flashString = @"Flash fired, auto mode";
            break;
        case 0x001D:
            flashString = @"Flash fired, auto mode, return light not detected";
            break;
        case 0x001F:
            flashString = @"Flash fired, auto mode, return light detected";
            break;
        case 0x0020:
            flashString = @"No flash function";
            break;
        case 0x0041:
            flashString = @"Flash fired, red-eye reduction mode";
            break;
        case 0x0045:
            flashString = @"Flash fired, red-eye reduction mode, return light not detected";
            break;
        case 0x0047:
            flashString = @"Flash fired, red-eye reduction mode, return light detected";
            break;
        case 0x0049:
            flashString = @"Flash fired, compulsory flash mode, red-eye reduction mode";
            break;
        case 0x004D:
            flashString = @"Flash fired, compulsory flash mode, red-eye reduction mode, return light not detected";
            break;
        case 0x004F:
            flashString = @"Flash fired, compulsory flash mode, red-eye reduction mode, return light detected";
            break;
        case 0x0059:
            flashString = @"Flash fired, auto mode, red-eye reduction mode";
            break;
        case 0x005D:
            flashString = @"Flash fired, auto mode, return light not detected, red-eye reduction mode";
            break;
        case 0x005F:
            flashString = @"Flash fired, auto mode, return light detected, red-eye reduction mode";
            break;
            
        default:
            break;
    }
    return flashString;
}


@end
