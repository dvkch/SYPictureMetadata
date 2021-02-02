//
//  SYMetadataExtensions.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

extension CFString {
    internal var string: String {
        return (self as NSString) as String
    }
}
