//
//  SYMetadataBase.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

public class SYMetadataBase : NSObject {

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
            dictionary[key] = object?.currentDictionary ?? NSNull()
        }
        return dictionary
    }
    private var valuesDictionary: [String: Any]

    // MARK: Children
    internal class var childrenMappings: [String: SYMetadataBase.Type] {
        return [:]
    }
    private var childrenObjects: [String: SYMetadataBase?] = [:]
    internal func getChildren<T: SYMetadataBase>(key: String) -> T? {
        guard let child = childrenObjects[key] else { return nil }
        return child as! T
    }
    internal func setChildren<T: SYMetadataBase>(key: String, value: T?) {
        // using the subscript would remove the value from the dictionary. we want to keep it, this is an intentional remove
        childrenObjects.updateValue(value, forKey: key)
    }
    
    // MARK: Debug
    #if DEBUG
    internal var debugReadKeys: Set<String> = []
    public var allDebugReadKeys: Set<String> {
        var keys = debugReadKeys
        self.childrenObjects.forEach { (key, child) in
            if let childKeys = child?.allDebugReadKeys {
                keys.formUnion(childKeys.map { [key, $0].joined(separator: ".") })
            }
        }
        return keys
    }
    internal var debugWrittenKeys: Set<String> = []
    public var allDebugWrittenKeys: Set<String> {
        var keys = debugWrittenKeys
        self.childrenObjects.forEach { (key, child) in
            if let childKeys = child?.allDebugWrittenKeys {
                keys.formUnion(childKeys.map { [key, $0].joined(separator: ".") })
            }
        }
        return keys
    }
    #endif

    // MARK: Values
    internal func getValue<T>(key: String) -> T? {
        #if DEBUG
        debugReadKeys.insert(key)
        #endif

        if valuesDictionary[key] == nil || valuesDictionary[key] as? NSObject == kCFNull {
            return nil
        }
        guard let value = valuesDictionary[key] as? T else {
            fatalError("value for key \(key) is not of the expected type \(T.self)")
        }

        #if DEBUG
        if T.self == Array<NSNumber>.self, let first = (value as! Array<NSNumber>).first {
            let typeString = NSString(cString: first.objCType, encoding: String.Encoding.ascii.rawValue)!
            print("-> \(type(of: self)).\(key) is configured as Array<NSNumber>, you could use '\(typeString)' instead")
        }
        if T.self == NSNumber.self {
            let typeString = NSString(cString: (value as! NSNumber).objCType, encoding: String.Encoding.ascii.rawValue)!
            print("-> \(type(of: self)).\(key) is configured as NSNumber, you could use '\(typeString)' instead")
        }
        if T.self == NSObject.self {
            print("-> \(type(of: self)).\(key) is configured as NSObject, you could use '\(type(of: value))' instead")
        }
        #endif
        return value
    }

    internal func getValue<T: RawRepresentable>(key: String) -> T? {
        let rawValue: T.RawValue? = getValue(key: key)
        if let rawValue = rawValue {
            return T(rawValue: rawValue)
        }
        return nil
    }

    internal func setValue<T: OptionalType>(key: String, value: T) {
        #if DEBUG
        debugWrittenKeys.insert(key)
        #endif

        if let value = value.value {
            valuesDictionary[key] = value
        } else {
            valuesDictionary[key] = NSNull() // needed to remove a value from the metadata
        }
    }

    internal func setValue<T: RawRepresentable>(key: String, value: T?) {
        setValue(key: key, value: value?.rawValue)
    }
}
