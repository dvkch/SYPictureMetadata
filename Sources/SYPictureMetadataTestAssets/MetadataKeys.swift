//
//  MetadataKeys.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 02/02/2021.
//  Copyright © 2021 Syan.me. All rights reserved.
//

import Foundation

private class EmptyClass: NSObject {}

public enum MetadataKeys: String, CaseIterable {
    case imageIO = "ImageIO.txt"
    case supported = "Supported.txt"
    case unsupported = "Unsupported.txt"
    
    public var url: URL {
        return Bundle.module.url(forResource: rawValue, withExtension: nil, subdirectory: "MetadataKeys")!
    }
    
    public func read() -> [String] {
        try! String(contentsOf: url).components(separatedBy: "\n")
    }
}

