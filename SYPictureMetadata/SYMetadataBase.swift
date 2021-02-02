//
//  SYMetadataBase.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

@objcMembers public class SYMetadataBase : NSObject {

    // MARK: Init
    public required init(dictionary: Dictionary<String, Any>) {
        self.originalDictionary = dictionary
        self.valuesDictionary = dictionary
        
        for (key, type) in Self.childrenMappings {
            if let value = self.valuesDictionary[key] as? [String: Any] {
                self.childrenObjects[key] = type.init(dictionary: value)
                self.valuesDictionary.removeValue(forKey: key)
            }
            else if self.valuesDictionary.keys.contains(key) {
                fatalError("value for key \(key) is not a metadata dictionary")
            }
        }
    }
    
    public convenience override init() {
        self.init(dictionary: [:])
    }
    
    // MARK: Properties
    public let originalDictionary: [String: Any]
    public var currentDictionary: [String: Any] {
        var dictionary = self.valuesDictionary
        for (key, object) in self.childrenObjects {
            dictionary[key] = object.currentDictionary
        }
        return dictionary
    }
    private var valuesDictionary: [String: Any]

    // MARK: Children
    internal class var childrenMappings: [String: SYMetadataBase.Type] {
        return [:]
    }
    private var childrenObjects: [String: SYMetadataBase] = [:]
    internal func getChildren<T: SYMetadataBase>(key: String) -> T? {
        return childrenObjects[key] as? T
    }
    internal func setChildren<T: SYMetadataBase>(key: String, value: T?) {
        childrenObjects[key] = value
    }
    
    // MARK: Values
    internal func getValue<T: RawRepresentable>(key: String) -> T? {
        if let value = valuesDictionary[key] as? T.RawValue {
            return T(rawValue: value)
        }
        fatalError("value for key \(key) is not of the expected type \(T.self)")
    }

    internal func getValue<T>(key: String) -> T {
        if let value = valuesDictionary[key] as? T {
            return value
        }
        fatalError("value for key \(key) is not of the expected type \(T.self)")
    }

    internal func setValue<T: RawRepresentable>(key: String, value: T?) {
        valuesDictionary[key] = value?.rawValue
    }

    internal func setValue<T>(key: String, value: T) {
        valuesDictionary[key] = value
    }
}
