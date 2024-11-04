//
//  TestFile.swift
//  SYPictureMetadataTests
//
//  Created by Stanislas Chevallier on 24/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import SYPictureMetadata

private class EmptyClass: NSObject {}

public enum TestFile: String, CaseIterable {
    case appleGPS = "TEST_APPLE_GPS.JPG"
    case eightBim = "TEST_8BIM.psd"
    case canon = "TEST_CANON.cr2"
    case ciff = "TEST_CIFF.CRW"
    case dng = "TEST_DNG.dng"
    case gif = "TEST_GIF.gif"
    case iptc = "TEST_IPTC.jpg"
    case iptc2 = "TEST_IPTC_2.jpg"
    case iptc3 = "TEST_IPTC_3.jpg"
    case nikon = "TEST_NIKON.nef"
    case pictureStyle = "TEST_PICTURESTYLE.CR2"
    case png = "TEST_PNG.png"
    case unreadable = "TEST_unreadable.txt"
    
    public var url: URL {
        return Bundle.module.url(forResource: rawValue, withExtension: nil, subdirectory: "TestFile")!
    }

    public func read() throws -> Data {
        try Data(contentsOf: url)
    }

    public func readMetadata() throws -> SYMetadata {
        return try SYMetadata(fileURL: url)
    }
}

