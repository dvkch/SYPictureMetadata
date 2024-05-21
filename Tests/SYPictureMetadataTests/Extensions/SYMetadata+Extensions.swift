//
//  SYMetadata+Extensions.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 13/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import SYPictureMetadata

extension SYMetadata {
    public var differencesFromOriginalMetadata: Dictionary<String, Any> {
        return self.currentDictionary.metadataDifferences(from: self.originalDictionary, includeValuesInDiff: true)
    }
}

