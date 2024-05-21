//
//  SYMetadataPNG.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataPNG : SYMetadataBase {

    // MARK: Types
    @objc public enum sRGBIntent : Int, CaseIterable {
        case perceptual             = 0
        case relativeColorimetric   = 1
        case saturation             = 2
        case absoluteColorimetric   = 3
    }

    public struct CompressionFilter : OptionSet {
        public let rawValue: Int32
        public init(rawValue: Int32) { self.rawValue = rawValue }
        static let noFilters    = CompressionFilter(rawValue: IMAGEIO_PNG_NO_FILTERS)
        static let none         = CompressionFilter(rawValue: IMAGEIO_PNG_FILTER_NONE)
        static let sub          = CompressionFilter(rawValue: IMAGEIO_PNG_FILTER_SUB)
        static let up           = CompressionFilter(rawValue: IMAGEIO_PNG_FILTER_UP)
        static let avg          = CompressionFilter(rawValue: IMAGEIO_PNG_FILTER_AVG)
        static let paeth        = CompressionFilter(rawValue: IMAGEIO_PNG_FILTER_PAETH)
        static let all          = [CompressionFilter.none, sub, .up, .avg, .paeth] // IMAGEIO_PNG_ALL_FILTERS
    }
    
    public enum InterlaceType: Int, CaseIterable {
        case nonInterlaced = 0
        case adam7Interlace = 1
    }

    // MARK: Values
    public var gamma: NSNumber? {
        get { getValue(key: kCGImagePropertyPNGGamma.string) }
        set { setValue(key: kCGImagePropertyPNGGamma.string, value: newValue) }
    }
    
    public var interlaceType: InterlaceType? {
        get { getValue(key: kCGImagePropertyPNGInterlaceType.string) }
        set { setValue(key: kCGImagePropertyPNGInterlaceType.string, value: newValue) }
    }
    
    public var xPixelsPerMeter: Int? {
        get { getValue(key: kCGImagePropertyPNGXPixelsPerMeter.string) }
        set { setValue(key: kCGImagePropertyPNGXPixelsPerMeter.string, value: newValue) }
    }
    
    public var yPixelsPerMeter: Int? {
        get { getValue(key: kCGImagePropertyPNGYPixelsPerMeter.string) }
        set { setValue(key: kCGImagePropertyPNGYPixelsPerMeter.string, value: newValue) }
    }
    
    public var sRGBIntent: sRGBIntent? {
        get { getValue(key: kCGImagePropertyPNGsRGBIntent.string) }
        set { setValue(key: kCGImagePropertyPNGsRGBIntent.string, value: newValue) }
    }
    
    public var chromaticities: Array<Double>? {
        get { getValue(key: kCGImagePropertyPNGChromaticities.string) }
        set { setValue(key: kCGImagePropertyPNGChromaticities.string, value: newValue) }
    }
    
    public var author: String? {
        get { getValue(key: kCGImagePropertyPNGAuthor.string) }
        set { setValue(key: kCGImagePropertyPNGAuthor.string, value: newValue) }
    }
    
    public var copyright: String? {
        get { getValue(key: kCGImagePropertyPNGCopyright.string) }
        set { setValue(key: kCGImagePropertyPNGCopyright.string, value: newValue) }
    }
    
    public var creationTime: String? {
        get { getValue(key: kCGImagePropertyPNGCreationTime.string) }
        set { setValue(key: kCGImagePropertyPNGCreationTime.string, value: newValue) }
    }
    
    public var descr: String? {
        get { getValue(key: kCGImagePropertyPNGDescription.string) }
        set { setValue(key: kCGImagePropertyPNGDescription.string, value: newValue) }
    }
    
    public var modificationTime: String? {
        get { getValue(key: kCGImagePropertyPNGModificationTime.string) }
        set { setValue(key: kCGImagePropertyPNGModificationTime.string, value: newValue) }
    }
    
    public var software: String? {
        get { getValue(key: kCGImagePropertyPNGSoftware.string) }
        set { setValue(key: kCGImagePropertyPNGSoftware.string, value: newValue) }
    }
    
    public var title: String? {
        get { getValue(key: kCGImagePropertyPNGTitle.string) }
        set { setValue(key: kCGImagePropertyPNGTitle.string, value: newValue) }
    }
    
    public var loopCount: Int? {
        get { getValue(key: kCGImagePropertyAPNGLoopCount.string) }
        set { setValue(key: kCGImagePropertyAPNGLoopCount.string, value: newValue) }
    }
    
    public var delayTime: Double? {
        get { getValue(key: kCGImagePropertyAPNGDelayTime.string) }
        set { setValue(key: kCGImagePropertyAPNGDelayTime.string, value: newValue) }
    }
    
    public var unclampedDelayTime: Double? {
        get { getValue(key: kCGImagePropertyAPNGUnclampedDelayTime.string) }
        set { setValue(key: kCGImagePropertyAPNGUnclampedDelayTime.string, value: newValue) }
    }
    
    public var compressionFilter: CompressionFilter? {
        get { getValue(key: kCGImagePropertyPNGCompressionFilter.string) }
        set { setValue(key: kCGImagePropertyPNGCompressionFilter.string, value: newValue) }
    }
}


