//
//  Keys.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 02/02/2021.
//  Copyright © 2021 Syan.me. All rights reserved.
//

import Foundation

enum Keys: String, CaseIterable {
    case imageIO = "ImageIO.txt"
    case supported = "Supported.txt"
    case unsupported = "Unsupported.txt"
    
    var url: URL! {
        #if EXAMPLE
        return Bundle(for: AppDelegate.self).url(forResource: rawValue, withExtension: nil, subdirectory: "Keys")
        #elseif TEST
        return Bundle(for: SYPictureMetadataTests.self).url(forResource: rawValue, withExtension: nil, subdirectory: "Keys")
        #endif
    }
    
    func read() -> [String] {
        try! String(contentsOf: url).components(separatedBy: "\n")
    }
}

