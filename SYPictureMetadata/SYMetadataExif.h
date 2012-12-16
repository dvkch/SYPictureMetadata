//
//  SYMetadataExif.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYMetadataBase.h"

typedef enum {
    SYPictureExifExposureProgram_NotDefined = 0,
    SYPictureExifExposureProgram_Manual = 1,
    SYPictureExifExposureProgram_NormalProgram = 2,
    SYPictureExifExposureProgram_AperturePriority = 3,
    SYPictureExifExposureProgram_ShutterPriority = 4,
    SYPictureExifExposureProgram_CreativeProgram = 5, // (biased toward depth of field)
    SYPictureExifExposureProgram_ActionProgram = 6, // (biased toward fast shutter speed)
    SYPictureExifExposureProgram_PortraitMode = 7, // (for closeup photos with the background out of focus)
    SYPictureExifExposureProgram_LandscapeMode = 8 // (for landscape photos with the background in focus)
} SYPictureExifExposureProgram;

typedef enum {
    SYPictureExifMeteringMode_Unknown = 0,
    SYPictureExifMeteringMode_Average = 1,
    SYPictureExifMeteringMode_CenterWeightedAverage = 2,
    SYPictureExifMeteringMode_Spot = 3,
    SYPictureExifMeteringMode_MultiSpot = 4,
    SYPictureExifMeteringMode_Pattern = 5,
    SYPictureExifMeteringMode_Partial = 6,
    SYPictureExifMeteringMode_Other = 255
} SYPictureExifMeteringMode;

typedef enum {
    SYPictureExifLightSource_Unknown = 0,
    SYPictureExifLightSource_Daylight = 1,
    SYPictureExifLightSource_Fluorescent = 2,
    SYPictureExifLightSource_TungstenIncandescentLight = 3,
    SYPictureExifLightSource_Flash = 4,
    SYPictureExifLightSource_FineWeather = 9,
    SYPictureExifLightSource_CloudyWeather = 10,
    SYPictureExifLightSource_Shade = 11,
    SYPictureExifLightSource_DaylightFluorescent = 12, // (D 5700 - 7100K)
    SYPictureExifLightSource_DayWhiteFluorescent = 13, // (N 4600 - 5400K)
    SYPictureExifLightSource_CoolWhiteFluorescent = 14, // (W 3900 - 4500K)
    SYPictureExifLightSource_WhiteFluorescent = 15, // (WW 3200 - 3700K)
    SYPictureExifLightSource_StandardLightA = 17,
    SYPictureExifLightSource_StandardLightB = 18,
    SYPictureExifLightSource_StandardLightC = 19,
    SYPictureExifLightSource_D55 = 20,
    SYPictureExifLightSource_D65 = 21,
    SYPictureExifLightSource_D75 = 22,
    SYPictureExifLightSource_D50 = 23,
    SYPictureExifLightSource_ISOStudioTungsten = 24,
    SYPictureExifLightSource_OtherLightSource = 255
} SYPictureExifLightSource;

typedef enum {
    SYPictureExifFocalPlaneResolutionUnit_NoAbsoluteUnitOfMeasurement = 1,
    SYPictureExifFocalPlaneResolutionUnit_Inch = 2,
    SYPictureExifFocalPlaneResolutionUnit_Centimeter = 3
} SYPictureExifFocalPlaneResolutionUnit;

typedef enum {
    SYPictureExifSensingMethod_NotDefined = 1,
    SYPictureExifSensingMethod_OneChipColorAreaSensor = 2,
    SYPictureExifSensingMethod_TwoChipColorAreaSensor = 3,
    SYPictureExifSensingMethod_ThreeChipColorAreaSensor = 4,
    SYPictureExifSensingMethod_ColorSequentialAreaSensor = 5,
    SYPictureExifSensingMethod_TrilinearSensor = 7,
    SYPictureExifSensingMethod_ColorSequentialLinearSensor = 8
} SYPictureExifSensingMethod;

typedef enum {
    SYPictureExifCustomRendered_NormalProcess = 0,
    SYPictureExifCustomRendered_CustomProcess = 1
} SYPictureExifCustomRendered;

typedef enum {
    SYPictureExifExposureMode_AutoExposure = 0,
    SYPictureExifExposureMode_ManualExposure = 1,
    SYPictureExifExposureMode_AutoBracket = 2
} SYPictureExifExposureMode;

typedef enum {
    SYPictureExifWhiteBalance_Auto = 0,
    SYPictureExifWhiteBalance_Manual = 1
} SYPictureExifWhiteBalance;

typedef enum {
    SYPictureExifSceneCaptureType_Standard = 0,
    SYPictureExifSceneCaptureType_Landscape = 1,
    SYPictureExifSceneCaptureType_Portrait = 2,
    SYPictureExifSceneCaptureType_NightScene = 3
} SYPictureExifSceneCaptureType;

typedef enum {
    SYPictureExifGainControl_None = 0,
    SYPictureExifGainControl_LowGainUp = 1,
    SYPictureExifGainControl_HighGainUp = 2,
    SYPictureExifGainControl_LowGainDown = 3,
    SYPictureExifGainControl_HighGainDown = 4
} SYPictureExifGainControl;

typedef enum {
    SYPictureExifContrast_Normal = 0,
    SYPictureExifContrast_Soft = 1,
    SYPictureExifContrast_Hard = 2
} SYPictureExifContrast;

typedef enum {
    SYPictureExifSaturation_Normal = 0,
    SYPictureExifSaturation_LowSaturation = 1,
    SYPictureExifSaturation_HighSaturation = 2
} SYPictureExifSaturation;

typedef enum {
    SYPictureExifSharpness_Normal = 0,
    SYPictureExifSharpness_Soft = 1,
    SYPictureExifSharpness_Hard = 2
} SYPictureExifSharpness;

typedef enum {
    SYPictureExifSubjectDistanceRange_Unknown = 0,
    SYPictureExifSubjectDistanceRange_Macro = 1,
    SYPictureExifSubjectDistanceRange_CloseView = 2,
    SYPictureExifSubjectDistanceRange_DistantView = 3
} SYPictureExifSubjectDistanceRange;





@interface SYMetadataExif : SYMetadataBase

@property (readonly, nonatomic, getter = getExposureTime)               NSNumber*   exposureTime;
@property (readonly, nonatomic, getter = getFNumber)                    NSNumber*   fNumber;
@property (readonly, nonatomic, getter = getExposureProgram)            NSNumber*   exposureProgram;
@property (readonly, nonatomic, getter = getSpectralSensitivity)        NSString*   spectralSensitivity;
@property (readonly, nonatomic, getter = getISOSpeedRatings)            NSNumber*   isoSpeedRatings;
@property (readonly, nonatomic, getter = getOECF)                       NSObject*   oecf;
@property (readonly, nonatomic, getter = getVersion)                    NSArray*    version;
@property (readonly, nonatomic, getter = getDateTimeOriginal)           NSString*   dateTimeOriginal;
@property (readonly, nonatomic, getter = getDateTimeDigitized)          NSString*   dateTimeDigitized;
@property (readonly, nonatomic, getter = getComponentsConfiguration)    NSArray*    componentsConfiguration;
@property (readonly, nonatomic, getter = getCompressedBitsPerPixel)     NSNumber*   compressedBitsPerPixel;
@property (readonly, nonatomic, getter = getShutterSpeedValue)          NSNumber*   shutterSpeedValue;
@property (readonly, nonatomic, getter = getApertureValue)              NSNumber*   apertureValue;
@property (readonly, nonatomic, getter = getBrightnessValue)            NSNumber*   brightnessValue;
@property (readonly, nonatomic, getter = getExposureBiasValue)          NSNumber*   exposureBiasValue;
@property (readonly, nonatomic, getter = getMaxApertureValue)           NSNumber*   maxApertureValue;
@property (readonly, nonatomic, getter = getSubjectDistance)            NSNumber*   subjectDistance;
@property (readonly, nonatomic, getter = getMeteringMode)               NSNumber*   meteringMode;
@property (readonly, nonatomic, getter = getLightSource)                NSNumber*   lightSource;
@property (readonly, nonatomic, getter = getFlash)                      NSNumber*   flash;
@property (readonly, nonatomic, getter = getFlashString)                NSString*   flashString;
@property (readonly, nonatomic, getter = getFocalLength)                NSNumber*   focalLength;
@property (readonly, nonatomic, getter = getSubjectArea)                NSArray*    subjectArea;
@property (readonly, nonatomic, getter = getMakerNote)                  NSObject*   makerNote;
@property (readonly, nonatomic, getter = getUserComment)                NSString*   userComment;
@property (readonly, nonatomic, getter = getSubsecTime)                 NSString*   subsecTime;
@property (readonly, nonatomic, getter = getSubsecTimeOriginal)         NSString*   subsecTimeOriginal;
@property (readonly, nonatomic, getter = getSubsecTimeDigitized)        NSString*   subsecTimeDigitized;
@property (readonly, nonatomic, getter = getFlashPixVersion)            NSString*   flashPixVersion;
@property (readonly, nonatomic, getter = getColorSpace)                 NSNumber*   colorSpace;
@property (readonly, nonatomic, getter = getPixelXDimension)            NSNumber*   pixelXDimension;
@property (readonly, nonatomic, getter = getPixelYDimension)            NSNumber*   pixelYDimension;
@property (readonly, nonatomic, getter = getRelatedSoundFile)           NSString*   relatedSoundFile;
@property (readonly, nonatomic, getter = getFlashEnergy)                NSNumber*   flashEnergy;
@property (readonly, nonatomic, getter = getSpatialFrequencyResponse)   NSObject*   spatialFrequencyResponse;
@property (readonly, nonatomic, getter = getFocalPlaneXResolution)      NSNumber*   focalPlaneXResolution;
@property (readonly, nonatomic, getter = getFocalPlaneYResolution)      NSNumber*   focalPlaneYResolution;
@property (readonly, nonatomic, getter = getFocalPlaneResolutionUnit)   NSNumber*   focalPlaneResolutionUnit;
@property (readonly, nonatomic, getter = getSubjectLocation)            NSArray*    subjectLocation;
@property (readonly, nonatomic, getter = getExposureIndex)              NSNumber*   exposureIndex;
@property (readonly, nonatomic, getter = getSensingMethod)              NSNumber*   sensingMethod;
@property (readonly, nonatomic, getter = getFileSource)                 NSObject*   fileSource;
@property (readonly, nonatomic, getter = getSceneType)                  NSObject*   sceneType;
@property (readonly, nonatomic, getter = getCFAPattern)                 NSArray*    cfaPattern;
@property (readonly, nonatomic, getter = getCustomRendered)             NSNumber*   customRendered;
@property (readonly, nonatomic, getter = getExposureMode)               NSNumber*   exposureMode;
@property (readonly, nonatomic, getter = getWhiteBalance)               NSNumber*   whiteBalance;
@property (readonly, nonatomic, getter = getDigitalZoomRatio)           NSNumber*   digitalZoomRatio;
@property (readonly, nonatomic, getter = getFocalLenIn35mmFilm)         NSNumber*   focalLenIn35mmFilm;
@property (readonly, nonatomic, getter = getSceneCaptureType)           NSNumber*   sceneCaptureType;
@property (readonly, nonatomic, getter = getGainControl)                NSNumber*   gainControl;
@property (readonly, nonatomic, getter = getContrast)                   NSNumber*   contrast;
@property (readonly, nonatomic, getter = getSaturation)                 NSNumber*   saturation;
@property (readonly, nonatomic, getter = getSharpness)                  NSNumber*   sharpness;
@property (readonly, nonatomic, getter = getDeviceSettingDescription)   NSObject*   deviceSettingDescription;
@property (readonly, nonatomic, getter = getSubjectDistRange)           NSNumber*   subjectDistRange;
@property (readonly, nonatomic, getter = getImageUniqueID)              NSString*   imageUniqueID;

// iOS 5+
@property (readonly, nonatomic, getter = getCameraOwnerName)            NSString*   cameraOwnerName;
@property (readonly, nonatomic, getter = getBodySerialNumber)           NSString*   bodySerialNumber;
@property (readonly, nonatomic, getter = getLensSpecification)          NSArray*    lensSpecification;
@property (readonly, nonatomic, getter = getLensMake)                   NSString*   lensMake;
@property (readonly, nonatomic, getter = getLensModel)                  NSString*   lensModel;
@property (readonly, nonatomic, getter = getLensSerialNumber)           NSString*   lensSerialNumber;
@property (readonly, nonatomic, getter = getGamma)                      NSNumber*   gamma;

@end
