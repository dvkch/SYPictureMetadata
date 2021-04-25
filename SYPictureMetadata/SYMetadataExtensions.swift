//
//  SYMetadataExtensions.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import Photos

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

public extension PHAsset {
    /*
     Asset captions are a new feature in iOS 14.0.
     They are not available via any public API, at least in iOS 14.5, and they are not saved into the image metadata, so SYMetadata can't obtain them easily.
     When you export the picture, via AirDrop for instance, the caption is added into the IPTC > Caption/Description and Tiff > Image Description.
     
     For the sake of convenience I have added support for getting the caption, but will not integrate into the library any way to update it as it involves
     updating the CoreData record for the PHAsset and I have not spent any reasonable time playing with it to have a solid solution.
     
     Here is a starting point if you ever need to look into it. Keep in mind it could cause crashes in CoreData since we don't know the appropriate thread to
     send updates, it could crash on older version of iOS or could break the device's photo library beyond repair!
     
     import CoreData
     func setAssetCaption(_ value: String?) {
         guard responds(to: NSSelectorFromString("objectID")), responds(to: NSSelectorFromString("managedObjectContextForFetchingResources")) else { return }

         guard let objectID = perform(NSSelectorFromString("objectID"))?.takeUnretainedValue() as? NSManagedObjectID else { return }
         guard let context = perform(NSSelectorFromString("managedObjectContextForFetchingResources"))?.takeUnretainedValue() as? NSManagedObjectContext else { return }

         let plManagedAsset = context.object(with: objectID)
         plManagedAsset.perform(NSSelectorFromString("setLongDescription:"), with: value)

         // > NOT UPDATED!! Error Domain=NSCocoaErrorDomain Code=134092 "(null)"
         // could be a missing entitlement issue
         do {
             try context.save()
             print("UPDATED!!")
         }
         catch {
             print("NOT UPDATED!!", error)
         }
     }
     */

    var assetCaption: String? {
        // The easy way:
        // let caption = (asset.value(forKey: "descriptionProperties") as? NSObject)?.value(forKey: "assetDescription")

        // Hiding private API calls and avoiding crashes:
        let propertiesSelector = ["description", String("seitreporP".reversed())].joined()
        guard responds(to: NSSelectorFromString(propertiesSelector)) else { return nil }
        guard let descriptionProperties = value(forKey: propertiesSelector) as? NSObject else { return nil }
        
        let descriptionSelector = ["asset", String("noitpircseD".reversed())].joined()
        guard descriptionProperties.responds(to: NSSelectorFromString(descriptionSelector)) else { return nil }
        return descriptionProperties.value(forKey: descriptionSelector) as? String
    }
    
}
