//
//  SYMetadataIPTCContactInfo.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataIPTCContactInfo : SYMetadataBase {

    // MARK: Values
    public var city: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoCity.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoCity.string, value: newValue) }
    }
    
    public var country: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoCountry.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoCountry.string, value: newValue) }
    }
    
    public var address: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoAddress.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoAddress.string, value: newValue) }
    }
    
    public var postalCode: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoPostalCode.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoPostalCode.string, value: newValue) }
    }
    
    public var stateProvince: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoStateProvince.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoStateProvince.string, value: newValue) }
    }
    
    public var emails: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoEmails.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoEmails.string, value: newValue) }
    }
    
    public var phones: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoPhones.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoPhones.string, value: newValue) }
    }
    
    public var webURLs: String? {
        get { getValue(key: kCGImagePropertyIPTCContactInfoWebURLs.string) }
        set { setValue(key: kCGImagePropertyIPTCContactInfoWebURLs.string, value: newValue) }
    }
}
