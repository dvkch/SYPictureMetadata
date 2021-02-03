//
//  SYMetadataGIF.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataGIF : SYMetadataBase {

    // MARK: Values
    public var loopCount: Int? {
        get { getValue(key: kCGImagePropertyGIFLoopCount.string) }
        set { setValue(key: kCGImagePropertyGIFLoopCount.string, value: newValue) }
    }

    public var delayTime: Double? {
        get { getValue(key: kCGImagePropertyGIFDelayTime.string) }
        set { setValue(key: kCGImagePropertyGIFDelayTime.string, value: newValue) }
    }
    
    public var imageColorMap: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyGIFImageColorMap.string) }
        set { setValue(key: kCGImagePropertyGIFImageColorMap.string, value: newValue) }
    }
    
    public var hasGlobalColorMap: Bool? {
        get { getValue(key: kCGImagePropertyGIFHasGlobalColorMap.string) }
        set { setValue(key: kCGImagePropertyGIFHasGlobalColorMap.string, value: newValue) }
    }
    
    public var unclampedDelayTime: Double? {
        get { getValue(key: kCGImagePropertyGIFUnclampedDelayTime.string) }
        set { setValue(key: kCGImagePropertyGIFUnclampedDelayTime.string, value: newValue) }
    }
}
