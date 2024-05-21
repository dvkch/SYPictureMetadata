//
//  SYMetadataExif.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataExif : SYMetadataBase {

    // MARK: Types
    @objc public enum ExposureProgram: Int, CaseIterable {
        case notDefined = 0
        case manual = 1
        case normalProgram = 2
        case aperturePriority = 3
        case shutterPriority = 4
        case creativeProgram = 5 // (biased toward depth of field)
        case actionProgram = 6 // (biased toward fast shutter speed)
        case portraitMode = 7 // (for closeup photos with the background out of focus)
        case landscapeMode = 8 // (for landscape photos with the background in focus)
    }

    @objc public enum MeteringMode: Int, CaseIterable {
        case unknown = 0
        case average = 1
        case centerWeightedAverage = 2
        case spot = 3
        case multiSpot = 4
        case pattern = 5
        case partial = 6
        case other = 255
    }

    @objc public enum LightSource: Int, CaseIterable {
        case unknown = 0
        case daylight = 1
        case fluorescent = 2
        case tungstenIncandescentLight = 3
        case flash = 4
        case fineWeather = 9
        case cloudyWeather = 10
        case shade = 11
        case daylightFluorescent = 12 // (D 5700 - 7100K)
        case dayWhiteFluorescent = 13 // (N 4600 - 5400K)
        case coolWhiteFluorescent = 14 // (W 3900 - 4500K)
        case whiteFluorescent = 15 // (WW 3200 - 3700K)
        case standardLightA = 17
        case standardLightB = 18
        case standardLightC = 19
        case d55 = 20
        case d65 = 21
        case d75 = 22
        case d50 = 23
        case isoStudioTungsten = 24
        case otherLightSource = 255
    }

    @objc public enum FocalPlaneResolutionUnit: Int, CaseIterable {
        case noAbsoluteUnitOfMeasurement = 1
        case inch = 2
        case centimeter = 3
    }

    @objc public enum SensingMethod: Int, CaseIterable {
        case notDefined = 1
        case oneChipColorAreaSensor = 2
        case twoChipColorAreaSensor = 3
        case threeChipColorAreaSensor = 4
        case colorSequentialAreaSensor = 5
        case trilinearSensor = 7
        case colorSequentialLinearSensor = 8
    }

    @objc public enum CustomRendered: Int, CaseIterable {
        case normalProcess = 0
        case customProcess = 1
    }

    @objc public enum ExposureMode: Int, CaseIterable {
        case autoExposure = 0
        case manualExposure = 1
        case autoBracket = 2
    }

    @objc public enum WhiteBalance: Int, CaseIterable {
        case auto = 0
        case manual = 1
    }

    @objc public enum SceneCaptureType: Int, CaseIterable {
        case standard = 0
        case landscape = 1
        case portrait = 2
        case nightScene = 3
    }

    @objc public enum GainControl: Int, CaseIterable {
        case none = 0
        case lowGainUp = 1
        case highGainUp = 2
        case lowGainDown = 3
        case highGainDown = 4
    }

    @objc public enum Contrast: Int, CaseIterable {
        case normal = 0
        case soft = 1
        case hard = 2
    }
    
    @objc public enum Saturation: Int, CaseIterable {
        case normal = 0
        case lowSaturation = 1
        case highSaturation = 2
    }

    @objc public enum Sharpness: Int, CaseIterable {
        case normal = 0
        case soft = 1
        case hard = 2
    }

    @objc public enum SubjectDistanceRange: Int, CaseIterable {
        case unknown = 0
        case macro = 1
        case closeView = 2
        case distantView = 3
    }
    
    @objc public enum SensitivityType: Int, CaseIterable {
        case unknown                                                          = 0
        case standardOutputSensitivity                                        = 1
        case recommendedExposureIndex                                         = 2
        case isoSpeed                                                         = 3
        case standardOutputSensitivityAndRecommendedExposureIndex             = 4
        case standardOutputSensitivityAndISOSpeed                             = 5
        case recommendedExposureIndexAndISOSpeed                              = 6
        case standardOutputSensitivityAndRecommendedExposureIndexAndISOSpeed  = 7
    }

    @objc public enum Flash: Int, CaseIterable {
        case flashDidNotFire                                                        = 0x0000
        case flashFired                                                             = 0x0001
        case strobeReturnLightNotDetected                                           = 0x0005
        case strobeReturnLightDetected                                              = 0x0007
        case flashFiredCompulsoryFlashMode                                          = 0x0009
        case flashFiredCompulsoryFlashModeReturnLightNotDetected                    = 0x000D
        case flashFiredCompulsoryFlashModeReturnLightDetected                       = 0x000F
        case flashDidNotFireCompulsoryDlashMode                                     = 0x0010
        case flashDidNotFireAutoMode                                                = 0x0018
        case flashFiredAutoMode                                                     = 0x0019
        case flashFiredAutoModeReturnLightNotDetected                               = 0x001D
        case flashFiredAutoModeReturnLightDetected                                  = 0x001F
        case noFlashFunction                                                        = 0x0020
        case flashFiredRedEyeReductionMode                                          = 0x0041
        case flashFiredRedEyeReductionModeReturnLightNotDetected                    = 0x0045
        case flashFiredRedEyeReductionModeReturnLightDetected                       = 0x0047
        case flashFiredCompulsoryFlashModeRedEyeReductionMode                       = 0x0049
        case flashFiredCompulsoryFlashModeRedEyeReductionModeReturnLightNotDetected = 0x004D
        case flashFiredCompulsoryFlashModeRedEyeReductionModeReturnLightDetected    = 0x004F
        case flashFiredAutoModeRedEyeReductionMode                                  = 0x0059
        case flashFiredAutoModeReturnLightNotDetectedRedEyeReductionMode            = 0x005D
        case flashFiredAutoModeReturnLightDetectedRedEyeReductionMode               = 0x005F
    }

    // MARK: Values
    public var exposureTime: Float? {
        get { getValue(key: kCGImagePropertyExifExposureTime.string) }
        set { setValue(key: kCGImagePropertyExifExposureTime.string, value: newValue) }
    }
    
    public var fNumber: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFNumber.string) }
        set { setValue(key: kCGImagePropertyExifFNumber.string, value: newValue) }
    }
    
    public var exposureProgram: NSNumber? {
        get { getValue(key: kCGImagePropertyExifExposureProgram.string) }
        set { setValue(key: kCGImagePropertyExifExposureProgram.string, value: newValue) }
    }
    
    public var spectralSensitivity: String? {
        get { getValue(key: kCGImagePropertyExifSpectralSensitivity.string) }
        set { setValue(key: kCGImagePropertyExifSpectralSensitivity.string, value: newValue) }
    }
    
    public var isoSpeedRatings: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifISOSpeedRatings.string) }
        set { setValue(key: kCGImagePropertyExifISOSpeedRatings.string, value: newValue) }
    }
    
    public var oecf: NSObject? {
        get { getValue(key: kCGImagePropertyExifOECF.string) }
        set { setValue(key: kCGImagePropertyExifOECF.string, value: newValue) }
    }
    
    public var version: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifVersion.string) }
        set { setValue(key: kCGImagePropertyExifVersion.string, value: newValue) }
    }
    
    public var dateTimeOriginal: String? {
        get { getValue(key: kCGImagePropertyExifDateTimeOriginal.string) }
        set { setValue(key: kCGImagePropertyExifDateTimeOriginal.string, value: newValue) }
    }
    
    public var dateTimeDigitized: String? {
        get { getValue(key: kCGImagePropertyExifDateTimeDigitized.string) }
        set { setValue(key: kCGImagePropertyExifDateTimeDigitized.string, value: newValue) }
    }
    
    public var componentsConfiguration: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifComponentsConfiguration.string) }
        set { setValue(key: kCGImagePropertyExifComponentsConfiguration.string, value: newValue) }
    }
    
    public var compressedBitsPerPixel: NSNumber? {
        get { getValue(key: kCGImagePropertyExifCompressedBitsPerPixel.string) }
        set { setValue(key: kCGImagePropertyExifCompressedBitsPerPixel.string, value: newValue) }
    }
    
    public var shutterSpeedValue: NSNumber? {
        get { getValue(key: kCGImagePropertyExifShutterSpeedValue.string) }
        set { setValue(key: kCGImagePropertyExifShutterSpeedValue.string, value: newValue) }
    }
    
    public var apertureValue: NSNumber? {
        get { getValue(key: kCGImagePropertyExifApertureValue.string) }
        set { setValue(key: kCGImagePropertyExifApertureValue.string, value: newValue) }
    }
    
    public var brightnessValue: NSNumber? {
        get { getValue(key: kCGImagePropertyExifBrightnessValue.string) }
        set { setValue(key: kCGImagePropertyExifBrightnessValue.string, value: newValue) }
    }
    
    public var exposureBiasValue: NSNumber? {
        get { getValue(key: kCGImagePropertyExifExposureBiasValue.string) }
        set { setValue(key: kCGImagePropertyExifExposureBiasValue.string, value: newValue) }
    }
    
    public var maxApertureValue: NSNumber? {
        get { getValue(key: kCGImagePropertyExifMaxApertureValue.string) }
        set { setValue(key: kCGImagePropertyExifMaxApertureValue.string, value: newValue) }
    }
    
    public var subjectDistance: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSubjectDistance.string) }
        set { setValue(key: kCGImagePropertyExifSubjectDistance.string, value: newValue) }
    }
    
    public var meteringMode: NSNumber? {
        get { getValue(key: kCGImagePropertyExifMeteringMode.string) }
        set { setValue(key: kCGImagePropertyExifMeteringMode.string, value: newValue) }
    }
    
    public var lightSource: NSNumber? {
        get { getValue(key: kCGImagePropertyExifLightSource.string) }
        set { setValue(key: kCGImagePropertyExifLightSource.string, value: newValue) }
    }
    
    public var flash: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFlash.string) }
        set { setValue(key: kCGImagePropertyExifFlash.string, value: newValue) }
    }
    
    public var focalLength: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFocalLength.string) }
        set { setValue(key: kCGImagePropertyExifFocalLength.string, value: newValue) }
    }
    
    public var subjectArea: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifSubjectArea.string) }
        set { setValue(key: kCGImagePropertyExifSubjectArea.string, value: newValue) }
    }
    
    public var makerNote: NSObject? {
        get { getValue(key: kCGImagePropertyExifMakerNote.string) }
        set { setValue(key: kCGImagePropertyExifMakerNote.string, value: newValue) }
    }
    
    public var userComment: String? {
        get { getValue(key: kCGImagePropertyExifUserComment.string) }
        set { setValue(key: kCGImagePropertyExifUserComment.string, value: newValue) }
    }
    
    public var subsecTime: String? {
        get { getValue(key: kCGImagePropertyExifSubsecTime.string) }
        set { setValue(key: kCGImagePropertyExifSubsecTime.string, value: newValue) }
    }
    
    public var subsecTimeOriginal: String? {
        get { getValue(key: kCGImagePropertyExifSubsecTimeOriginal.string) }
        set { setValue(key: kCGImagePropertyExifSubsecTimeOriginal.string, value: newValue) }
    }
    
    public var subsecTimeDigitized: String? {
        get { getValue(key: kCGImagePropertyExifSubsecTimeDigitized.string) }
        set { setValue(key: kCGImagePropertyExifSubsecTimeDigitized.string, value: newValue) }
    }
    
    public var flashPixVersion: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifFlashPixVersion.string) }
        set { setValue(key: kCGImagePropertyExifFlashPixVersion.string, value: newValue) }
    }
    
    public var colorSpace: NSNumber? {
        get { getValue(key: kCGImagePropertyExifColorSpace.string) }
        set { setValue(key: kCGImagePropertyExifColorSpace.string, value: newValue) }
    }
    
    public var pixelXDimension: NSNumber? {
        get { getValue(key: kCGImagePropertyExifPixelXDimension.string) }
        set { setValue(key: kCGImagePropertyExifPixelXDimension.string, value: newValue) }
    }
    
    public var pixelYDimension: NSNumber? {
        get { getValue(key: kCGImagePropertyExifPixelYDimension.string) }
        set { setValue(key: kCGImagePropertyExifPixelYDimension.string, value: newValue) }
    }
    
    public var relatedSoundFile: String? {
        get { getValue(key: kCGImagePropertyExifRelatedSoundFile.string) }
        set { setValue(key: kCGImagePropertyExifRelatedSoundFile.string, value: newValue) }
    }
    
    public var flashEnergy: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFlashEnergy.string) }
        set { setValue(key: kCGImagePropertyExifFlashEnergy.string, value: newValue) }
    }
    
    public var spatialFrequencyResponse: NSObject? {
        get { getValue(key: kCGImagePropertyExifSpatialFrequencyResponse.string) }
        set { setValue(key: kCGImagePropertyExifSpatialFrequencyResponse.string, value: newValue) }
    }
    
    public var focalPlaneXResolution: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFocalPlaneXResolution.string) }
        set { setValue(key: kCGImagePropertyExifFocalPlaneXResolution.string, value: newValue) }
    }
    
    public var focalPlaneYResolution: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFocalPlaneYResolution.string) }
        set { setValue(key: kCGImagePropertyExifFocalPlaneYResolution.string, value: newValue) }
    }
    
    public var focalPlaneResolutionUnit: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFocalPlaneResolutionUnit.string) }
        set { setValue(key: kCGImagePropertyExifFocalPlaneResolutionUnit.string, value: newValue) }
    }
    
    public var subjectLocation: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifSubjectLocation.string) }
        set { setValue(key: kCGImagePropertyExifSubjectLocation.string, value: newValue) }
    }
    
    public var exposureIndex: NSNumber? {
        get { getValue(key: kCGImagePropertyExifExposureIndex.string) }
        set { setValue(key: kCGImagePropertyExifExposureIndex.string, value: newValue) }
    }
    
    public var sensingMethod: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSensingMethod.string) }
        set { setValue(key: kCGImagePropertyExifSensingMethod.string, value: newValue) }
    }
    
    public var fileSource: NSObject? {
        get { getValue(key: kCGImagePropertyExifFileSource.string) }
        set { setValue(key: kCGImagePropertyExifFileSource.string, value: newValue) }
    }
    
    public var sceneType: NSObject? {
        get { getValue(key: kCGImagePropertyExifSceneType.string) }
        set { setValue(key: kCGImagePropertyExifSceneType.string, value: newValue) }
    }
    
    public var cfaPattern: NSArray? {
        get { getValue(key: kCGImagePropertyExifCFAPattern.string) }
        set { setValue(key: kCGImagePropertyExifCFAPattern.string, value: newValue) }
    }
    
    public var customRendered: NSNumber? {
        get { getValue(key: kCGImagePropertyExifCustomRendered.string) }
        set { setValue(key: kCGImagePropertyExifCustomRendered.string, value: newValue) }
    }
    
    public var exposureMode: NSNumber? {
        get { getValue(key: kCGImagePropertyExifExposureMode.string) }
        set { setValue(key: kCGImagePropertyExifExposureMode.string, value: newValue) }
    }
    
    public var whiteBalance: NSNumber? {
        get { getValue(key: kCGImagePropertyExifWhiteBalance.string) }
        set { setValue(key: kCGImagePropertyExifWhiteBalance.string, value: newValue) }
    }
    
    public var digitalZoomRatio: NSNumber? {
        get { getValue(key: kCGImagePropertyExifDigitalZoomRatio.string) }
        set { setValue(key: kCGImagePropertyExifDigitalZoomRatio.string, value: newValue) }
    }
    
    public var focalLenIn35mmFilm: NSNumber? {
        get { getValue(key: kCGImagePropertyExifFocalLenIn35mmFilm.string) }
        set { setValue(key: kCGImagePropertyExifFocalLenIn35mmFilm.string, value: newValue) }
    }
    
    public var sceneCaptureType: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSceneCaptureType.string) }
        set { setValue(key: kCGImagePropertyExifSceneCaptureType.string, value: newValue) }
    }
    
    public var gainControl: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSceneCaptureType.string) }
        set { setValue(key: kCGImagePropertyExifSceneCaptureType.string, value: newValue) }
    }
    
    public var contrast: NSNumber? {
        get { getValue(key: kCGImagePropertyExifContrast.string) }
        set { setValue(key: kCGImagePropertyExifContrast.string, value: newValue) }
    }
    
    public var saturation: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSaturation.string) }
        set { setValue(key: kCGImagePropertyExifSaturation.string, value: newValue) }
    }
    
    public var sharpness: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSharpness.string) }
        set { setValue(key: kCGImagePropertyExifSharpness.string, value: newValue) }
    }
    
    public var deviceSettingDescription: NSObject? {
        get { getValue(key: kCGImagePropertyExifDeviceSettingDescription.string) }
        set { setValue(key: kCGImagePropertyExifDeviceSettingDescription.string, value: newValue) }
    }
    
    public var subjectDistRange: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSubjectDistRange.string) }
        set { setValue(key: kCGImagePropertyExifSubjectDistRange.string, value: newValue) }
    }
    
    public var imageUniqueID: String? {
        get { getValue(key: kCGImagePropertyExifImageUniqueID.string) }
        set { setValue(key: kCGImagePropertyExifImageUniqueID.string, value: newValue) }
    }
    
    public var cameraOwnerName: String? {
        get { getValue(key: kCGImagePropertyExifCameraOwnerName.string) }
        set { setValue(key: kCGImagePropertyExifCameraOwnerName.string, value: newValue) }
    }
    
    public var bodySerialNumber: String? {
        get { getValue(key: kCGImagePropertyExifBodySerialNumber.string) }
        set { setValue(key: kCGImagePropertyExifBodySerialNumber.string, value: newValue) }
    }
    
    public var lensSpecification: NSArray? {
        get { getValue(key: kCGImagePropertyExifLensSpecification.string) }
        set { setValue(key: kCGImagePropertyExifLensSpecification.string, value: newValue) }
    }
    
    public var lensMake: String? {
        get { getValue(key: kCGImagePropertyExifLensMake.string) }
        set { setValue(key: kCGImagePropertyExifLensMake.string, value: newValue) }
    }
    
    public var lensModel: String? {
        get { getValue(key: kCGImagePropertyExifLensModel.string) }
        set { setValue(key: kCGImagePropertyExifLensModel.string, value: newValue) }
    }
    
    public var lensSerialNumber: String? {
        get { getValue(key: kCGImagePropertyExifLensSerialNumber.string) }
        set { setValue(key: kCGImagePropertyExifLensSerialNumber.string, value: newValue) }
    }
    
    public var gamma: NSNumber? {
        get { getValue(key: kCGImagePropertyExifLensSerialNumber.string) }
        set { setValue(key: kCGImagePropertyExifLensSerialNumber.string, value: newValue) }
    }
    
    public var sensitivityType: NSNumber? {
        get { getValue(key: kCGImagePropertyExifSensitivityType.string) }
        set { setValue(key: kCGImagePropertyExifSensitivityType.string, value: newValue) }
    }
    
    public var standardOutputSensitivity: NSNumber? {
        get { getValue(key: kCGImagePropertyExifStandardOutputSensitivity.string) }
        set { setValue(key: kCGImagePropertyExifStandardOutputSensitivity.string, value: newValue) }
    }
    
    public var recommendedExposureIndex: NSNumber? {
        get { getValue(key: kCGImagePropertyExifRecommendedExposureIndex.string) }
        set { setValue(key: kCGImagePropertyExifRecommendedExposureIndex.string, value: newValue) }
    }
    
    public var isoSpeed: NSNumber? {
        get { getValue(key: kCGImagePropertyExifISOSpeed.string) }
        set { setValue(key: kCGImagePropertyExifISOSpeed.string, value: newValue) }
    }
    
    public var isoSpeedLatitudeyyy: NSNumber? {
        get { getValue(key: kCGImagePropertyExifISOSpeedLatitudeyyy.string) }
        set { setValue(key: kCGImagePropertyExifISOSpeedLatitudeyyy.string, value: newValue) }
    }
    
    public var isoSpeedLatitudezzz: NSNumber? {
        get { getValue(key: kCGImagePropertyExifISOSpeedLatitudezzz.string) }
        set { setValue(key: kCGImagePropertyExifISOSpeedLatitudezzz.string, value: newValue) }
    }
}
