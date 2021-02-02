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

@objcMembers public class SYMetadataCIFF : SYMetadataBase {

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
    
    public var releaseMethod: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFReleaseMethod.string) }
        set { setValue(key: kCGImagePropertyCIFFReleaseMethod.string, value: newValue) }
    }
    
    public var releaseTiming: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFReleaseTiming.string) }
        set { setValue(key: kCGImagePropertyCIFFReleaseTiming.string, value: newValue) }
    }
    
    public var recordID: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFRecordID.string) }
        set { setValue(key: kCGImagePropertyCIFFRecordID.string, value: newValue) }
    }
    
    public var selfTimingTime: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFSelfTimingTime.string) }
        set { setValue(key: kCGImagePropertyCIFFSelfTimingTime.string, value: newValue) }
    }
    
    public var cameraSerialNumber: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFCameraSerialNumber.string) }
        set { setValue(key: kCGImagePropertyCIFFCameraSerialNumber.string, value: newValue) }
    }
    
    public var imageSerialNumber: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFImageSerialNumber.string) }
        set { setValue(key: kCGImagePropertyCIFFImageSerialNumber.string, value: newValue) }
    }
    
    public var continuousDrive: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFContinuousDrive.string) }
        set { setValue(key: kCGImagePropertyCIFFContinuousDrive.string, value: newValue) }
    }
    
    public var focusMode: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFFocusMode.string) }
        set { setValue(key: kCGImagePropertyCIFFFocusMode.string, value: newValue) }
    }
    
    public var meteringMode: NSNumber? {
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
    
    public var lensMaxMM: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFLensMaxMM.string) }
        set { setValue(key: kCGImagePropertyCIFFLensMaxMM.string, value: newValue) }
    }
    
    public var lensMinMM: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFLensMinMM.string) }
        set { setValue(key: kCGImagePropertyCIFFLensMinMM.string, value: newValue) }
    }
    
    public var whiteBalanceIndex: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string) }
        set { setValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string, value: newValue) }
    }
    
    public var flashExposureComp: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFFlashExposureComp.string) }
        set { setValue(key: kCGImagePropertyCIFFFlashExposureComp.string, value: newValue) }
    }
    
    public var measuredEV: NSNumber? {
        get { getValue(key: kCGImagePropertyCIFFMeasuredEV.string) }
        set { setValue(key: kCGImagePropertyCIFFMeasuredEV.string, value: newValue) }
    }
    
    public var uniqueModelID: NSNumber? {
        get { getValue(key: kSYImagePropertyCIFFUniqueModelID.string) }
        set { setValue(key: kSYImagePropertyCIFFUniqueModelID.string, value: newValue) }
    }
    
    public var maxAperture: NSNumber? {
        get { getValue(key: kSYImagePropertyCIFFMaxAperture.string) }
        set { setValue(key: kSYImagePropertyCIFFMaxAperture.string, value: newValue) }
    }
    
    public var minAperture: NSNumber? {
        get { getValue(key: kSYImagePropertyCIFFMinAperture.string) }
        set { setValue(key: kSYImagePropertyCIFFMinAperture.string, value: newValue) }
    }
}
