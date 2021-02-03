//
//  SYMetadataMakerCanon.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataMakerCanon : SYMetadataBase {

    // MARK: Types
    @objc public enum AspectRatio: Int, CaseIterable {
        case ratio_3_2 = 0
        case ratio_1_1 = 1
        case ratio_4_3 = 2
        case ratio_16_9 = 7
        case ratio_4_5 = 8
        case ratio_3_2_apshCrop = 12
        case ratio_3_2_apscCrop = 13
    }
    
    // MARK: Values
    public var ownerName: String? {
        get { getValue(key: kCGImagePropertyMakerCanonOwnerName.string) }
        set { setValue(key: kCGImagePropertyMakerCanonOwnerName.string, value: newValue) }
    }
    
    public var cameraSerialNumber: Int? {
        get { getValue(key: kCGImagePropertyMakerCanonCameraSerialNumber.string) }
        set { setValue(key: kCGImagePropertyMakerCanonCameraSerialNumber.string, value: newValue) }
    }
    
    public var imageSerialNumber: Int? {
        get { getValue(key: kCGImagePropertyMakerCanonImageSerialNumber.string) }
        set { setValue(key: kCGImagePropertyMakerCanonImageSerialNumber.string, value: newValue) }
    }
    
    public var flashExposureComp: NSNumber? {
        get { getValue(key: kCGImagePropertyMakerCanonFlashExposureComp.string) }
        set { setValue(key: kCGImagePropertyMakerCanonFlashExposureComp.string, value: newValue) }
    }
    
    public var continuousDrive: SYMetadataCIFF.ContinousDrive? {
        get { getValue(key: kCGImagePropertyMakerCanonContinuousDrive.string) }
        set { setValue(key: kCGImagePropertyMakerCanonContinuousDrive.string, value: newValue) }
    }
    
    public var lensModel: String? {
        get { getValue(key: kCGImagePropertyMakerCanonLensModel.string) }
        set { setValue(key: kCGImagePropertyMakerCanonLensModel.string, value: newValue) }
    }
    
    public var firmware: String? {
        get { getValue(key: kCGImagePropertyMakerCanonFirmware.string) }
        set { setValue(key: kCGImagePropertyMakerCanonFirmware.string, value: newValue) }
    }
    
    public var aspectRatioInfo: AspectRatio? {
        get { getValue(key: kCGImagePropertyMakerCanonAspectRatioInfo.string) }
        set { setValue(key: kCGImagePropertyMakerCanonAspectRatioInfo.string, value: newValue) }
    }

    // data is read by iOS but is not accessible via a publicly declared key. we use the ones from CIFF
    public var whiteBalance: SYMetadataCIFF.WhiteBalance? {
        get { getValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string) }
        set { setValue(key: kCGImagePropertyCIFFWhiteBalanceIndex.string, value: newValue) }
    }

    public var uniqueModelID: Int? {
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

