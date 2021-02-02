//
//  Dictionary+Extensions.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 13/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

extension Dictionary where Value == Any {
    var removingData: Dictionary {
        return self.mapValues { (value) -> Value in
            if let value = value as? Data {
                return "Data: \(value.base64EncodedString())"
            }
            if let value = value as? Self {
                return value.removingData
            }
            return value
        }
    }
    
    var jsonString: String {
        do {
            var options = JSONSerialization.WritingOptions.prettyPrinted
            if #available(iOS 11.0, *) {
                options.insert(.sortedKeys)
            }
            let data = try JSONSerialization.data(withJSONObject: self.removingData, options: options)
            return String(data: data, encoding: .utf8) ?? ""
        }
        catch {
            return "Couldn't convert to JSON: \(error)"
        }
    }
}

extension Dictionary where Key: CustomStringConvertible {
    var allKeyPaths: [String] {
        var keyPaths = [String]()
        
        for key in keys {
            let keyString = key.description
            keyPaths.append(keyString)
            
            if let subDic = self[key] as? [Key: Any] {
                let subKeyPaths = subDic.allKeyPaths.map { keyString + "." + $0 }
                keyPaths.append(contentsOf: subKeyPaths)
            }
        }
        
        return keyPaths
    }
}

extension Dictionary where Key == String {
    func metadataDifferences(from dictionaryOld: [Key: Value], includeValuesInDiff: Bool) -> [Key: Any] {
        let dictionaryNew = self
        
        let formatAdded    = (includeValuesInDiff ? "Added: %@"          : "Added"  )
        let formatUpdated  = (includeValuesInDiff ? "Updated: %@ -> %@"  : "Updated")
        let formatRemoved  = (includeValuesInDiff ? "Removed: %@"        : "Removed")
        
        var allKeys = Set<Key>()
        allKeys = allKeys.union(dictionaryOld.keys)
        allKeys = allKeys.union(dictionaryNew.keys)
        
        var diffs = [String: Any]()
        for key in allKeys {
            let valueOld = dictionaryOld[key]
            let valueNew = dictionaryNew[key]

            if anyEqual(valueOld, valueNew) { continue }

            let oldIsNilOrDic = valueOld == nil || (valueOld as? Self) != nil
            let newIsNilOrDic = valueNew == nil || (valueNew as? Self) != nil
            
            if (oldIsNilOrDic && newIsNilOrDic) {
                let subDicOld = valueOld as? Self ?? [:]
                let subDicNew = valueNew as? Self ?? [:]
                diffs[key] = subDicNew.metadataDifferences(from: subDicOld, includeValuesInDiff: includeValuesInDiff)
                continue
            }

            var valueOldString = anyDescription(for: valueOld)
            var valueNewString = anyDescription(for: valueNew)
            
            if let array = valueOld as? [Any] {
                valueOldString = array.map { anyDescription(for: $0) }.joined(separator: ", ")
            }
            if let array = valueNew as? [Any] {
                valueNewString = array.map { anyDescription(for: $0) }.joined(separator: ", ")
            }

            if (valueOld != nil && valueNew == nil) {
                diffs[key] = String(format: formatRemoved, valueOldString)
                continue
            }

            if (valueOld == nil && valueNew != nil) {
                diffs[key] = String(format: formatAdded, valueNewString)
                continue
            }

            diffs[key] = String(format: formatUpdated, valueOldString, valueNewString)
        }
        
        return diffs
    }
}
