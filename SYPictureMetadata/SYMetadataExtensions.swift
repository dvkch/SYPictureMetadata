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

internal protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    internal var value: (Wrapped)? {
        switch self {
        case .none:             return nil
        case .some(let value):  return value
        }
    }
}
