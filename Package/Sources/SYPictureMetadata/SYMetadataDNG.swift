//
//  SYMetadataDNG.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

// https://www.adobe.com/content/dam/Adobe/en/products/photoshop/pdfs/dng_spec_1.4.0.0.pdf

@objcMembers public class SYMetadataDNG : SYMetadataBase {

    public enum LightSource: Int, CaseIterable {
        case unknown = 0
        case daylight = 1
        case fluorescent = 2
        case tungstenIncandescent = 3
        case flash = 4
        case fineWeather = 9
        case cloudy = 10
        case shade = 11
        case daylightFluorescent = 12
        case dayWhiteFluorescent = 13
        case coolWhiteFluorescent = 14
        case whiteFluorescent = 15
        case warmWhiteFluorescent = 16
        case standardLightA = 17
        case standardLightB = 18
        case standardLightC = 19
        case d55 = 20
        case d65 = 21
        case d75 = 22
        case d50 = 23
        case isoStudioTungsten = 24
        case other = 255
    }
    
    // MARK: Values
    public var version: Array<Int>? {
        get { getValue(key: kCGImagePropertyDNGVersion.string) }
        set { setValue(key: kCGImagePropertyDNGVersion.string, value: newValue) }
    }
   
    public var backwardVersion: Array<Int>? {
        get { getValue(key: kCGImagePropertyDNGBackwardVersion.string) }
        set { setValue(key: kCGImagePropertyDNGBackwardVersion.string, value: newValue) }
    }
    
    public var uniqueCameraModel: String? {
        get { getValue(key: kCGImagePropertyDNGUniqueCameraModel.string) }
        set { setValue(key: kCGImagePropertyDNGUniqueCameraModel.string, value: newValue) }
    }
    
    public var localizedCameraModel: String? {
        get { getValue(key: kCGImagePropertyDNGLocalizedCameraModel.string) }
        set { setValue(key: kCGImagePropertyDNGLocalizedCameraModel.string, value: newValue) }
    }
    
    public var cameraSerialNumber: String? {
        get { getValue(key: kCGImagePropertyDNGCameraSerialNumber.string) }
        set { setValue(key: kCGImagePropertyDNGCameraSerialNumber.string, value: newValue) }
    }
    
    public var lensInfo: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGLensInfo.string) }
        set { setValue(key: kCGImagePropertyDNGLensInfo.string, value: newValue) }
    }
    
    public var blackLevel: Array<Float>? {
        get { getValue(key: kCGImagePropertyDNGBlackLevel.string) }
        set { setValue(key: kCGImagePropertyDNGBlackLevel.string, value: newValue) }
    }
    
    public var whiteLevel: Array<Int>? {
        get { getValue(key: kCGImagePropertyDNGWhiteLevel.string) }
        set { setValue(key: kCGImagePropertyDNGWhiteLevel.string, value: newValue) }
    }
    
    public var calibrationIlluminant1: LightSource? {
        get { getValue(key: kCGImagePropertyDNGCalibrationIlluminant1.string) }
        set { setValue(key: kCGImagePropertyDNGCalibrationIlluminant1.string, value: newValue) }
    }
    
    public var calibrationIlluminant2: LightSource? {
        get { getValue(key: kCGImagePropertyDNGCalibrationIlluminant2.string) }
        set { setValue(key: kCGImagePropertyDNGCalibrationIlluminant2.string, value: newValue) }
    }
    
    public var colorMatrix1: Array<Float>? {
        get { getValue(key: kCGImagePropertyDNGColorMatrix1.string) }
        set { setValue(key: kCGImagePropertyDNGColorMatrix1.string, value: newValue) }
    }
    
    public var colorMatrix2: Array<Float>? {
        get { getValue(key: kCGImagePropertyDNGColorMatrix2.string) }
        set { setValue(key: kCGImagePropertyDNGColorMatrix2.string, value: newValue) }
    }
    
    public var cameraCalibration1: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGCameraCalibration1.string) }
        set { setValue(key: kCGImagePropertyDNGCameraCalibration1.string, value: newValue) }
    }
    
    public var cameraCalibration2: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGCameraCalibration2.string) }
        set { setValue(key: kCGImagePropertyDNGCameraCalibration2.string, value: newValue) }
    }
    
    public var asShotNeutral: Array<Float>? {
        get { getValue(key: kCGImagePropertyDNGAsShotNeutral.string) }
        set { setValue(key: kCGImagePropertyDNGAsShotNeutral.string, value: newValue) }
    }
    
    public var asShotWhiteXY: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGAsShotWhiteXY.string) }
        set { setValue(key: kCGImagePropertyDNGAsShotWhiteXY.string, value: newValue) }
    }
    
    public var baselineExposure: Float? {
        get { getValue(key: kCGImagePropertyDNGBaselineExposure.string) }
        set { setValue(key: kCGImagePropertyDNGBaselineExposure.string, value: newValue) }
    }
    
    public var baselineNoise: Float? {
        get { getValue(key: kCGImagePropertyDNGBaselineNoise.string) }
        set { setValue(key: kCGImagePropertyDNGBaselineNoise.string, value: newValue) }
    }
    
    public var baselineSharpness: Float? {
        get { getValue(key: kCGImagePropertyDNGBaselineSharpness.string) }
        set { setValue(key: kCGImagePropertyDNGBaselineSharpness.string, value: newValue) }
    }
    
    public var privateData: NSObject? {
        get { getValue(key: kCGImagePropertyDNGPrivateData.string) }
        set { setValue(key: kCGImagePropertyDNGPrivateData.string, value: newValue) }
    }
    
    public var cameraCalibrationSignature: String? {
        get { getValue(key: kCGImagePropertyDNGCameraCalibrationSignature.string) }
        set { setValue(key: kCGImagePropertyDNGCameraCalibrationSignature.string, value: newValue) }
    }
    
    public var profileCalibrationSignature: String? {
        get { getValue(key: kCGImagePropertyDNGProfileCalibrationSignature.string) }
        set { setValue(key: kCGImagePropertyDNGProfileCalibrationSignature.string, value: newValue) }
    }
    
    public var noiseProfile: Array<Double>? {
        get { getValue(key: kCGImagePropertyDNGNoiseProfile.string) }
      	set { setValue(key: kCGImagePropertyDNGNoiseProfile.string, value: newValue) }
    }
    
    public var warpRectilinear: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGWarpRectilinear.string) }
        set { setValue(key: kCGImagePropertyDNGWarpRectilinear.string, value: newValue) }
    }
    
    public var warpFisheye: Array<NSNumber>? {
      	get { getValue(key: kCGImagePropertyDNGWarpFisheye.string) }
        set { setValue(key: kCGImagePropertyDNGWarpFisheye.string, value: newValue) }
    }
    
    public var fixVignetteRadial: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyDNGFixVignetteRadial.string) }
        set { setValue(key: kCGImagePropertyDNGFixVignetteRadial.string, value: newValue) }
    }
}

