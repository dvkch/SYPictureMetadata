//
//  SYMetadataJFIF.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataJFIF : SYMetadataBase {

    // MARK: Values
    public var version: Array<Int>? {
        get { getValue(key: kCGImagePropertyJFIFVersion.string) }
        set { setValue(key: kCGImagePropertyJFIFVersion.string, value: newValue) }
    }

    public var xDensity: Int? {
        get { getValue(key: kCGImagePropertyJFIFXDensity.string) }
        set { setValue(key: kCGImagePropertyJFIFXDensity.string, value: newValue) }
    }

    public var yDensity: Int? {
        get { getValue(key: kCGImagePropertyJFIFYDensity.string) }
        set { setValue(key: kCGImagePropertyJFIFYDensity.string, value: newValue) }
    }

    public var densityUnit: NSNumber? {
        get { getValue(key: kCGImagePropertyJFIFDensityUnit.string) }
        set { setValue(key: kCGImagePropertyJFIFDensityUnit.string, value: newValue) }
    }

    public var isProgressive: Bool? {
        get { getValue(key: kCGImagePropertyJFIFIsProgressive.string) }
        set { setValue(key: kCGImagePropertyJFIFIsProgressive.string, value: newValue) }
    }
}

