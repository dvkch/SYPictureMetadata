//
//  SYMetadataCIFF.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

// https://raw.githubusercontent.com/wiki/drewnoakes/metadata-extractor/docs/CIFFspecV1R04.pdf
// Nota: this is assuming attributes from CIFF and MakerCanon use the same types

@objcMembers public class SYMetadataCIFF : SYMetadataBase {

    // MARK: Types
    public enum ReleaseMethod: Int, CaseIterable {
        case singleShot = 0
        case continuousShooting = 2
    }
    
    public enum ReleaseTiming: Int, CaseIterable {
        case priorityOnShutter = 0
        case priorityOnFocus = 1
    }
    
    public enum MeteringMode: Int, CaseIterable {
        case `default` = 0
        case spot = 1
        case average = 2
        case evaluative = 3
        case partial = 4
        case centerWeightedAverage = 5
    }
    
    public enum WhiteBalance: Int, CaseIterable {
        case auto = 0
        case daylight = 1
        case cloudy = 2
        case tungsten = 3
        case fluorescent = 4
        case flash = 5
        case custom = 6
        case blackAndWhite = 7
        case shade = 8
        case manualTemperatureKelvin = 9
        case pcSet1 = 10
        case pcSet2 = 11
        case pcSet3 = 12
        case daylightFluorescent = 14
        case custom1 = 15
        case custom2 = 16
        case underwater = 17
        case custom3 = 18
        case custom4 = 19
        case pcSet4 = 20
        case pcSet5 = 21
        case autoAmbiencePriority = 23
    }
    
    public enum ContinousDrive: Int, CaseIterable {
        case single = 0
        case continuous = 1
        case movie = 2
        case continuousSpeedPriority = 3
        case continuousLow = 4
        case continuousHigh = 5
        case silentSingle = 6
        case singleSilent = 9
        case continuousSilent = 10
    }
    
    public enum FocusMode: Int, CaseIterable {
        case oneShotAF = 0
        case aiServoAF = 1
        case aiFocusAF = 2
        case manualFocus3 = 3
        case single = 4
        case continuous = 5
        case manualFocus6 = 6
        case panFocus = 16
        case af_mf = 256
        case movieSnapFocus = 512
        case movieServoAF = 519
    }
    
    // MARK: Values
    public var descr: String? {
        get { getValue(key: kCGImagePropertyCIFFDescription.string) }
        set { setValue(key: kCGImagePropertyCIFFDescription.string, value: newValue) }
    }
    
    public var firmware: String? {
        get { getValue(key: kCGImagePropertyCIFFFirmware.string) }
        set { setValue(key: kCGImagePropertyCIFFFirmware.string, value: newValue) }
    }
    
    public var ownerName: String? {
        get { getValue(key: kCGImagePropertyCIFFOwnerName.string) }
        set { setValue(key: kCGImagePropertyCIFFOwnerName.string, value: newValue) }
    }
    
    public var imageName: String? {
        get { getValue(key: kCGImagePropertyCIFFImageName.string) }
        set { setValue(key: kCGImagePropertyCIFFImageName.string, value: newValue) }
    }
    
    public var imageFileName: String? {
        get { getValue(key: kCGImagePropertyCIFFImageFileName.string) }
        set { setValue(key: kCGImagePropertyCIFFImageFileName.string, value: newValue) }
    }
    
    public var releaseMethod: ReleaseMethod? {
        get { getValue(key: kCGImagePropertyCIFFReleaseMethod.string) }
        set { setValue(key: kCGImagePropertyCIFFReleaseMethod.string, value: newValue) }
    }
    
    public var releaseTiming: ReleaseTiming? {
        get { getValue(key: kCGImagePropertyCIFFReleaseTiming.string) }
        set { setValue(key: kCGImagePropertyCIFFReleaseTiming.string, value: newValue) }
    }
    
    public var recordID: UInt? {
        get { getValue(key: kCGImagePropertyCIFFRecordID.string) }
        set { setValue(key: kCGImagePropertyCIFFRecordID.string, value: newValue) }
    }
    
    public var selfTimingTime: UInt? {
        get { getValue(key: kCGImagePropertyCIFFSelfTimingTime.string) }
        set { setValue(key: kCGImagePropertyCIFFSelfTimingTime.string, value: newValue) }
    }
    
    public var cameraSerialNumber: UInt? {
        get { getValue(key: kCGImagePropertyCIFFCameraSerialNumber.string) }
        set { setValue(key: kCGImagePropertyCIFFCameraSerialNumber.string, value: newValue) }
    }
    
    public var imageSerialNumber: UInt? {
        get { getValue(key: kCGImagePropertyCIFFImageSerialNumber.string) }
        set { setValue(key: kCGImagePropertyCIFFImageSerialNumber.string, value: newValue) }
    }
    
    public var continuousDrive: ContinousDrive? {
        get { getValue(key: kCGImagePropertyCIFFContinuousDrive.string) }
        set { setValue(key: kCGImagePropertyCIFFContinuousDrive.string, value: newValue) }
    }
    
    public var focusMode: FocusMode? {
        get { getValue(key: kCGImagePropertyCIFFFocusMode.string) }
        set { setValue(key: kCGImagePropertyCIFFFocusMode.string, value: newValue) }
    }
    
    public var meteringMode: MeteringMode? {
        get { getValue(key: kCGImagePropertyCIFFMeteringMode.string) }
        set { setValue(key: kCGImagePropertyCIFFMeteringMode.string, value: newValue) }
    }
    
    public var shootingMode: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFShootingMode.string) }
        set { setValue(key: kCGImagePropertyCIFFShootingMode.string, value: newValue) }
    }
    
    public var lensModel: String? {
        get { getValue(key: kCGImagePropertyCIFFLensModel.string) }
        set { setValue(key: kCGImagePropertyCIFFLensModel.string, value: newValue) }
    }
    
    public var lensMaxMM: Int? {
        get { getValue(key: kCGImagePropertyCIFFLensMaxMM.string) }
        set { setValue(key: kCGImagePropertyCIFFLensMaxMM.string, value: newValue) }
    }
    
    public var lensMinMM: Int? {
        get { getValue(key: kCGImagePropertyCIFFLensMinMM.string) }
        set { setValue(key: kCGImagePropertyCIFFLensMinMM.string, value: newValue) }
    }
    
    public var whiteBalance: WhiteBalance? {
        get { getValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string) }
        set { setValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string, value: newValue) }
    }
    
    public var flashExposureComp: Int? {
        get { getValue(key: kCGImagePropertyCIFFFlashExposureComp.string) }
        set { setValue(key: kCGImagePropertyCIFFFlashExposureComp.string, value: newValue) }
    }
    
    public var measuredEV: Double? {
        get { getValue(key: kCGImagePropertyCIFFMeasuredEV.string) }
        set { setValue(key: kCGImagePropertyCIFFMeasuredEV.string, value: newValue) }
    }
    
    public var uniqueModelID: UInt? {
        get { getValue(key: kSYImagePropertyCIFFUniqueModelID.string) }
        set { setValue(key: kSYImagePropertyCIFFUniqueModelID.string, value: newValue) }
    }
    
    public var maxAperture: Double? {
        get { getValue(key: kSYImagePropertyCIFFMaxAperture.string) }
        set { setValue(key: kSYImagePropertyCIFFMaxAperture.string, value: newValue) }
    }
    
    public var minAperture: Double? {
        get { getValue(key: kSYImagePropertyCIFFMinAperture.string) }
        set { setValue(key: kSYImagePropertyCIFFMinAperture.string, value: newValue) }
    }
}
