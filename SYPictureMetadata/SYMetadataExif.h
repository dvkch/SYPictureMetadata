//
//  SYMetadataExif.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
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

typedef enum : NSUInteger {
    SYMetadataExifSensitivityType_Unknown                                                          = 0,
    SYMetadataExifSensitivityType_StandardOutputSensitivity                                        = 1,
    SYMetadataExifSensitivityType_RecommendedExposureIndex                                         = 2,
    SYMetadataExifSensitivityType_ISOSpeed                                                         = 3,
    SYMetadataExifSensitivityType_StandardOutputSensitivityAndRecommendedExposureIndex             = 4,
    SYMetadataExifSensitivityType_StandardOutputSensitivityAndISOSpeed                             = 5,
    SYMetadataExifSensitivityType_RecommendedExposureIndexAndISOSpeed                              = 6,
    SYMetadataExifSensitivityType_StandardOutputSensitivityAndRecommendedExposureIndexAndISOSpeed  = 7,
} SYMetadataExifSensitivityType;

typedef enum : NSUInteger {
    SYMetadataExifFlash_FlashDidNotFire                                                        = 0x0000,
    SYMetadataExifFlash_FlashFired                                                             = 0x0001,
    SYMetadataExifFlash_StrobeReturnLightNotDetected                                           = 0x0005,
    SYMetadataExifFlash_StrobeReturnLightDetected                                              = 0x0007,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashMode                                          = 0x0009,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashModeReturnLightNotDetected                    = 0x000D,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashModeReturnLightDetected                       = 0x000F,
    SYMetadataExifFlash_FlashDidNotFireCompulsoryDlashMode                                     = 0x0010,
    SYMetadataExifFlash_FlashDidNotFireAutoMode                                                = 0x0018,
    SYMetadataExifFlash_FlashFiredAutoMode                                                     = 0x0019,
    SYMetadataExifFlash_FlashFiredAutoModeReturnLightNotDetected                               = 0x001D,
    SYMetadataExifFlash_FlashFiredAutoModeReturnLightDetected                                  = 0x001F,
    SYMetadataExifFlash_NoFlashFunction                                                        = 0x0020,
    SYMetadataExifFlash_FlashFiredRedEyeReductionMode                                          = 0x0041,
    SYMetadataExifFlash_FlashFiredRedEyeReductionModeReturnLightNotDetected                    = 0x0045,
    SYMetadataExifFlash_FlashFiredRedEyeReductionModeReturnLightDetected                       = 0x0047,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashModeRedEyeReductionMode                       = 0x0049,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashModeRedEyeReductionModeReturnLightNotDetected = 0x004D,
    SYMetadataExifFlash_FlashFiredCompulsoryFlashModeRedEyeReductionModeReturnLightDetected    = 0x004F,
    SYMetadataExifFlash_FlashFiredAutoModeRedEyeReductionMode                                  = 0x0059,
    SYMetadataExifFlash_FlashFiredAutoModeReturnLightNotDetectedRedEyeReductionMode            = 0x005D,
    SYMetadataExifFlash_FlashFiredAutoModeReturnLightDetectedRedEyeReductionMode               = 0x005F,
} SYMetadataExifFlash;

@interface SYMetadataExif : SYMetadataBase

@property (nonatomic, copy, readonly) NSNumber              *exposureTime;
@property (nonatomic, copy, readonly) NSNumber              *fNumber;
@property (nonatomic, copy, readonly) NSNumber              *exposureProgram;
@property (nonatomic, copy, readonly) NSString              *spectralSensitivity;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *isoSpeedRatings;
@property (nonatomic, copy, readonly) NSObject              *oecf;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *version;
@property (nonatomic, copy, readonly) NSString              *dateTimeOriginal;
@property (nonatomic, copy, readonly) NSString              *dateTimeDigitized;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *componentsConfiguration;
@property (nonatomic, copy, readonly) NSNumber              *compressedBitsPerPixel;
@property (nonatomic, copy, readonly) NSNumber              *shutterSpeedValue;
@property (nonatomic, copy, readonly) NSNumber              *apertureValue;
@property (nonatomic, copy, readonly) NSNumber              *brightnessValue;
@property (nonatomic, copy, readonly) NSNumber              *exposureBiasValue;
@property (nonatomic, copy, readonly) NSNumber              *maxApertureValue;
@property (nonatomic, copy, readonly) NSNumber              *subjectDistance;
@property (nonatomic, copy, readonly) NSNumber              *meteringMode;
@property (nonatomic, copy, readonly) NSNumber              *lightSource;
@property (nonatomic, copy, readonly) NSNumber              *flash;
@property (nonatomic, copy, readonly) NSString              *flashString;
@property (nonatomic, copy, readonly) NSNumber              *focalLength;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *subjectArea;
@property (nonatomic, copy, readonly) NSObject              *makerNote;
@property (nonatomic, copy, readonly) NSString              *userComment;
@property (nonatomic, copy, readonly) NSString              *subsecTime;
@property (nonatomic, copy, readonly) NSString              *subsecTimeOriginal;
@property (nonatomic, copy, readonly) NSString              *subsecTimeDigitized;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *flashPixVersion;
@property (nonatomic, copy, readonly) NSNumber              *colorSpace;
@property (nonatomic, copy, readonly) NSNumber              *pixelXDimension;
@property (nonatomic, copy, readonly) NSNumber              *pixelYDimension;
@property (nonatomic, copy, readonly) NSString              *relatedSoundFile;
@property (nonatomic, copy, readonly) NSNumber              *flashEnergy;
@property (nonatomic, copy, readonly) NSObject              *spatialFrequencyResponse;
@property (nonatomic, copy, readonly) NSNumber              *focalPlaneXResolution;
@property (nonatomic, copy, readonly) NSNumber              *focalPlaneYResolution;
@property (nonatomic, copy, readonly) NSNumber              *focalPlaneResolutionUnit;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *subjectLocation;
@property (nonatomic, copy, readonly) NSNumber              *exposureIndex;
@property (nonatomic, copy, readonly) NSNumber              *sensingMethod;
@property (nonatomic, copy, readonly) NSObject              *fileSource;
@property (nonatomic, copy, readonly) NSObject              *sceneType;
@property (nonatomic, copy, readonly) NSArray               *cfaPattern;
@property (nonatomic, copy, readonly) NSNumber              *customRendered;
@property (nonatomic, copy, readonly) NSNumber              *exposureMode;
@property (nonatomic, copy, readonly) NSNumber              *whiteBalance;
@property (nonatomic, copy, readonly) NSNumber              *digitalZoomRatio;
@property (nonatomic, copy, readonly) NSNumber              *focalLenIn35mmFilm;
@property (nonatomic, copy, readonly) NSNumber              *sceneCaptureType;
@property (nonatomic, copy, readonly) NSNumber              *gainControl;
@property (nonatomic, copy, readonly) NSNumber              *contrast;
@property (nonatomic, copy, readonly) NSNumber              *saturation;
@property (nonatomic, copy, readonly) NSNumber              *sharpness;
@property (nonatomic, copy, readonly) NSObject              *deviceSettingDescription;
@property (nonatomic, copy, readonly) NSNumber              *subjectDistRange;
@property (nonatomic, copy, readonly) NSString              *imageUniqueID;
@property (nonatomic, copy, readonly) NSString              *cameraOwnerName;
@property (nonatomic, copy, readonly) NSString              *bodySerialNumber;
@property (nonatomic, copy, readonly) NSArray               *lensSpecification;
@property (nonatomic, copy, readonly) NSString              *lensMake;
@property (nonatomic, copy, readonly) NSString              *lensModel;
@property (nonatomic, copy, readonly) NSString              *lensSerialNumber;
@property (nonatomic, copy, readonly) NSNumber              *gamma;
@property (nonatomic, copy, readonly) NSNumber              *sensitivityType;
@property (nonatomic, copy, readonly) NSNumber              *standardOutputSensitivity;
@property (nonatomic, copy, readonly) NSNumber              *recommendedExposureIndex;
@property (nonatomic, copy, readonly) NSNumber              *isoSpeed;
@property (nonatomic, copy, readonly) NSNumber              *isoSpeedLatitudeyyy;
@property (nonatomic, copy, readonly) NSNumber              *isoSpeedLatitudezzz;

@end


