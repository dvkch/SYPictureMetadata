//
//  SYMetadataExifAux.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataExifAux : SYMetadataBase {

    // MARK: Values
    public var lensInfo: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyExifAuxLensInfo.string) }
        set { setValue(key: kCGImagePropertyExifAuxLensInfo.string, value: newValue) }
    }
    
    public var lensModel: String? {
        get { getValue(key: kCGImagePropertyExifAuxLensModel.string) }
        set { setValue(key: kCGImagePropertyExifAuxLensModel.string, value: newValue) }
    }
    
    public var serialNumber: String? {
        get { getValue(key: kCGImagePropertyExifAuxSerialNumber.string) }
        set { setValue(key: kCGImagePropertyExifAuxSerialNumber.string, value: newValue) }
    }
    
    public var lensID: NSNumber? {
        get { getValue(key: kCGImagePropertyExifAuxLensID.string) }
        set { setValue(key: kCGImagePropertyExifAuxLensID.string, value: newValue) }
    }
    
    public var lensSerialNumber: String? {
        get { getValue(key: kCGImagePropertyExifAuxLensSerialNumber.string) }
        set { setValue(key: kCGImagePropertyExifAuxLensSerialNumber.string, value: newValue) }
    }
    
    public var imageNumber: NSNumber? {
        get { getValue(key: kCGImagePropertyExifAuxImageNumber.string) }
        set { setValue(key: kCGImagePropertyExifAuxImageNumber.string, value: newValue) }
    }
    
    public var flashCompensation: NSObject? {
        get { getValue(key: kCGImagePropertyExifAuxFlashCompensation.string) }
        set { setValue(key: kCGImagePropertyExifAuxFlashCompensation.string, value: newValue) }
    }
    
    public var ownerName: String? {
        get { getValue(key: kCGImagePropertyExifAuxOwnerName.string) }
        set { setValue(key: kCGImagePropertyExifAuxOwnerName.string, value: newValue) }
    }
    
    public var firmware: NSObject? {
        get { getValue(key: kCGImagePropertyExifAuxFirmware.string) }
        set { setValue(key: kCGImagePropertyExifAuxFirmware.string, value: newValue) }
    }
    
    public var afInfo: NSArray? {
        get { getValue(key: kSYImagePropertyExifAuxAutoFocusInfo.string) }
        set { setValue(key: kSYImagePropertyExifAuxAutoFocusInfo.string, value: newValue) }
    }
    
    public var imageStabilization: NSNumber? {
        get { getValue(key: kSYImagePropertyExifAuxImageStabilization.string) }
        set { setValue(key: kSYImagePropertyExifAuxImageStabilization.string, value: newValue) }
    }

    // iOS reads the data but the keys are not publicly declared, we use the Nikon equivalents
    public var focusMode: NSNumber? {
        get { getValue(key: kCGImagePropertyMakerNikonFocusMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFocusMode.string, value: newValue) }
    }
    
    public var focusDistance: NSNumber? {
        get { getValue(key: kCGImagePropertyMakerNikonFocusDistance.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFocusDistance.string, value: newValue) }
    }
}
