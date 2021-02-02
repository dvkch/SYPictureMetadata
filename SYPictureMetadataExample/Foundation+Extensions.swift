//
//  Foundation+Extensions.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 13/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

func anyDescription(for value: Any?) -> String {
    if let value = value as? CustomStringConvertible {
        return value.description
    }
    if let value = value {
        return "\(value)"
    }
    return "<nil>"
}

func anyEqual(_ a: Any?, _ b: Any?) -> Bool {
    if a == nil && b == nil { return true }
    if a == nil && b != nil { return false }
    if a != nil && b == nil { return false }
    if let a = a as? NSObject, let b = b as? NSObject { return a == b }
    print("anyEqual: unhandled types \(anyDescription(for: a)) and \(anyDescription(for: b))")
    return false
}

