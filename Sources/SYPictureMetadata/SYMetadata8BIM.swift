//
//  SYMetadata8BIM.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

public class SYMetadata8BIM : SYMetadataBase {

    // MARK: Values
    public var layerNames: Array<String>? {
        get { getValue(key: kCGImageProperty8BIMLayerNames.string) }
        set { setValue(key: kCGImageProperty8BIMLayerNames.string, value: newValue) }
    }
    
    public var version: Int? {
        get { getValue(key: kCGImageProperty8BIMVersion.string) }
        set { setValue(key: kCGImageProperty8BIMVersion.string, value: newValue) }
    }
}
