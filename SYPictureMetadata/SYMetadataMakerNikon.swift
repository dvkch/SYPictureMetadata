//
//  SYMetadataMakerNikon.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataMakerNikon : SYMetadataBase {

    // MARK: Types
    public struct ShootingMode : OptionSet {
        public let rawValue: Int32
        public init(rawValue: Int32) { self.rawValue = rawValue }
        public static let continuous             = ShootingMode(rawValue: 1 << 0)
        public static let delay                  = ShootingMode(rawValue: 1 << 1)
        public static let pcControl              = ShootingMode(rawValue: 1 << 2)
        public static let selfTimer              = ShootingMode(rawValue: 1 << 3)
        public static let exposureBracketing     = ShootingMode(rawValue: 1 << 4)
        public static let autoISO                = ShootingMode(rawValue: 1 << 5)
        public static let whiteBalanceBracketing = ShootingMode(rawValue: 1 << 6)
        public static let irControl              = ShootingMode(rawValue: 1 << 7)
        public static let dLightingBracketing    = ShootingMode(rawValue: 1 << 8)
    }

    public struct LensType : OptionSet {
        public let rawValue: Int32
        public init(rawValue: Int32) { self.rawValue = rawValue }
        public static let MF = LensType(rawValue: 1 << 0)
        public static let D  = LensType(rawValue: 1 << 1)
        public static let G  = LensType(rawValue: 1 << 2)
        public static let VR = LensType(rawValue: 1 << 3)
    }

    // MARK: Values
    public var isoSetting: Array<Int>? {
        get { getValue(key: kCGImagePropertyMakerNikonISOSetting.string) }
        set { setValue(key: kCGImagePropertyMakerNikonISOSetting.string, value: newValue) }
    }
    
    public var colorMode: String? {
        get { getValue(key: kCGImagePropertyMakerNikonColorMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonColorMode.string, value: newValue) }
    }
    
    public var quality: String? {
        get { getValue(key: kCGImagePropertyMakerNikonQuality.string) }
        set { setValue(key: kCGImagePropertyMakerNikonQuality.string, value: newValue) }
    }
    
    public var whiteBalanceMode: String? {
        get { getValue(key: kCGImagePropertyMakerNikonWhiteBalanceMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonWhiteBalanceMode.string, value: newValue) }
    }
    
    public var sharpenMode: String? {
        get { getValue(key: kCGImagePropertyMakerNikonSharpenMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonSharpenMode.string, value: newValue) }
    }
    
    public var focusMode: String? {
        get { getValue(key: kCGImagePropertyMakerNikonFocusMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFocusMode.string, value: newValue) }
    }
    
    public var flashSetting: String? {
        get { getValue(key: kCGImagePropertyMakerNikonFlashSetting.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFlashSetting.string, value: newValue) }
    }
    
    public var isoSelection: String? {
        get { getValue(key: kCGImagePropertyMakerNikonISOSelection.string) }
        set { setValue(key: kCGImagePropertyMakerNikonISOSelection.string, value: newValue) }
    }
    
    public var flashExposureComp: NSObject? {
        get { getValue(key: kCGImagePropertyMakerNikonFlashExposureComp.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFlashExposureComp.string, value: newValue) }
    }
    
    public var imageAdjustment: String? {
        get { getValue(key: kCGImagePropertyMakerNikonImageAdjustment.string) }
        set { setValue(key: kCGImagePropertyMakerNikonImageAdjustment.string, value: newValue) }
    }
    
    public var lensAdapter: NSObject? {
        get { getValue(key: kCGImagePropertyMakerNikonLensAdapter.string) }
        set { setValue(key: kCGImagePropertyMakerNikonLensAdapter.string, value: newValue) }
    }
    
    public var lensType: LensType? {
        get { getValue(key: kCGImagePropertyMakerNikonLensType.string) }
        set { setValue(key: kCGImagePropertyMakerNikonLensType.string, value: newValue) }
    }
    
    public var lensInfo: NSObject? {
        get { getValue(key: kCGImagePropertyMakerNikonLensInfo.string) }
        set { setValue(key: kCGImagePropertyMakerNikonLensInfo.string, value: newValue) }
    }
    
    public var focusDistance: NSNumber? {
        get { getValue(key: kCGImagePropertyMakerNikonFocusDistance.string) }
        set { setValue(key: kCGImagePropertyMakerNikonFocusDistance.string, value: newValue) }
    }
    
    public var digitalZoom: NSNumber? {
        get { getValue(key: kCGImagePropertyMakerNikonDigitalZoom.string) }
        set { setValue(key: kCGImagePropertyMakerNikonDigitalZoom.string, value: newValue) }
    }
    
    public var shootingMode: ShootingMode? {
        get { getValue(key: kCGImagePropertyMakerNikonShootingMode.string) }
        set { setValue(key: kCGImagePropertyMakerNikonShootingMode.string, value: newValue) }
    }
    
    public var cameraSerialNumber: String? {
        get { getValue(key: kCGImagePropertyMakerNikonCameraSerialNumber.string) }
        set { setValue(key: kCGImagePropertyMakerNikonCameraSerialNumber.string, value: newValue) }
    }
    
    public var shutterCount: Int? {
        get { getValue(key: kCGImagePropertyMakerNikonShutterCount.string) }
        set { setValue(key: kCGImagePropertyMakerNikonShutterCount.string, value: newValue) }
    }
}
