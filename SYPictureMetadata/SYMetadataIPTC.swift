//
//  SYMetadataIPTC.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataIPTC : SYMetadataBase {

    // MARK: Children
    internal override class var childrenMappings: [String: SYMetadataBase.Type] {
        return [kCGImagePropertyIPTCCreatorContactInfo.string: SYMetadataIPTCContactInfo.self]
    }
    
    public var creatorContactInfo: SYMetadataIPTCContactInfo? {
        get { getChildren(key: kCGImagePropertyIPTCCreatorContactInfo.string) }
        set { setChildren(key: kCGImagePropertyIPTCCreatorContactInfo.string, value: newValue) }
    }

    // MARK: Values
    public var objectTypeReference: String? {
        get { getValue(key: kCGImagePropertyIPTCObjectTypeReference.string) }
        set { setValue(key: kCGImagePropertyIPTCObjectTypeReference.string, value: newValue) }
    }
    
    public var objectAttributeReference: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCObjectAttributeReference.string) }
        set { setValue(key: kCGImagePropertyIPTCObjectAttributeReference.string, value: newValue) }
    }
    
    public var objectName: String? {
        get { getValue(key: kCGImagePropertyIPTCObjectName.string) }
        set { setValue(key: kCGImagePropertyIPTCObjectName.string, value: newValue) }
    }
    
    public var editStatus: String? {
        get { getValue(key: kCGImagePropertyIPTCEditStatus.string) }
        set { setValue(key: kCGImagePropertyIPTCEditStatus.string, value: newValue) }
    }
    
    public var editorialUpdate: String? {
        get { getValue(key: kCGImagePropertyIPTCEditorialUpdate.string) }
        set { setValue(key: kCGImagePropertyIPTCEditorialUpdate.string, value: newValue) }
    }
    
    public var urgency: String? {
        get { getValue(key: kCGImagePropertyIPTCUrgency.string) }
        set { setValue(key: kCGImagePropertyIPTCUrgency.string, value: newValue) }
    }
    
    public var subjectReference: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCSubjectReference.string) }
        set { setValue(key: kCGImagePropertyIPTCSubjectReference.string, value: newValue) }
    }
    
    public var category: String? {
        get { getValue(key: kCGImagePropertyIPTCCategory.string) }
        set { setValue(key: kCGImagePropertyIPTCCategory.string, value: newValue) }
    }
    
    public var supplementalCategory: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCSupplementalCategory.string) }
        set { setValue(key: kCGImagePropertyIPTCSupplementalCategory.string, value: newValue) }
    }
    
    public var fixtureIdentifier: String? {
        get { getValue(key: kCGImagePropertyIPTCFixtureIdentifier.string) }
        set { setValue(key: kCGImagePropertyIPTCFixtureIdentifier.string, value: newValue) }
    }
    
    public var keywords: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCKeywords.string) }
        set { setValue(key: kCGImagePropertyIPTCKeywords.string, value: newValue) }
    }
    
    public var contentLocationCode: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCContentLocationCode.string) }
        set { setValue(key: kCGImagePropertyIPTCContentLocationCode.string, value: newValue) }
    }
    
    public var contentLocationName: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCContentLocationName.string) }
        set { setValue(key: kCGImagePropertyIPTCContentLocationName.string, value: newValue) }
    }
    
    public var releaseDate: String? {
        get { getValue(key: kCGImagePropertyIPTCReleaseDate.string) }
        set { setValue(key: kCGImagePropertyIPTCReleaseDate.string, value: newValue) }
    }
    
    public var releaseTime: String? {
        get { getValue(key: kCGImagePropertyIPTCReleaseTime.string) }
        set { setValue(key: kCGImagePropertyIPTCReleaseTime.string, value: newValue) }
    }
    
    public var expirationDate: String? {
        get { getValue(key: kCGImagePropertyIPTCExpirationDate.string) }
        set { setValue(key: kCGImagePropertyIPTCExpirationDate.string, value: newValue) }
    }
    
    public var expirationTime: String? {
        get { getValue(key: kCGImagePropertyIPTCExpirationTime.string) }
        set { setValue(key: kCGImagePropertyIPTCExpirationTime.string, value: newValue) }
    }
    
    public var specialInstructions: String? {
        get { getValue(key: kCGImagePropertyIPTCSpecialInstructions.string) }
        set { setValue(key: kCGImagePropertyIPTCSpecialInstructions.string, value: newValue) }
    }
    
    public var actionAdvised: String? {
        get { getValue(key: kCGImagePropertyIPTCActionAdvised.string) }
        set { setValue(key: kCGImagePropertyIPTCActionAdvised.string, value: newValue) }
    }
    
    public var referenceService: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCReferenceService.string) }
        set { setValue(key: kCGImagePropertyIPTCReferenceService.string, value: newValue) }
    }
    
    public var referenceDate: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCReferenceDate.string) }
        set { setValue(key: kCGImagePropertyIPTCReferenceDate.string, value: newValue) }
    }
    
    public var referenceNumber: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCReferenceNumber.string) }
        set { setValue(key: kCGImagePropertyIPTCReferenceNumber.string, value: newValue) }
    }
    
    public var dateCreated: String? {
        get { getValue(key: kCGImagePropertyIPTCDateCreated.string) }
        set { setValue(key: kCGImagePropertyIPTCDateCreated.string, value: newValue) }
    }
    
    public var timeCreated: String? {
        get { getValue(key: kCGImagePropertyIPTCTimeCreated.string) }
        set { setValue(key: kCGImagePropertyIPTCTimeCreated.string, value: newValue) }
    }
    
    public var digitalCreationDate: String? {
        get { getValue(key: kCGImagePropertyIPTCDigitalCreationDate.string) }
        set { setValue(key: kCGImagePropertyIPTCDigitalCreationDate.string, value: newValue) }
    }
    
    public var digitalCreationTime: String? {
        get { getValue(key: kCGImagePropertyIPTCDigitalCreationTime.string) }
        set { setValue(key: kCGImagePropertyIPTCDigitalCreationTime.string, value: newValue) }
    }
    
    public var originatingProgram: String? {
        get { getValue(key: kCGImagePropertyIPTCOriginatingProgram.string) }
        set { setValue(key: kCGImagePropertyIPTCOriginatingProgram.string, value: newValue) }
    }
    
    public var programVersion: String? {
        get { getValue(key: kCGImagePropertyIPTCProgramVersion.string) }
        set { setValue(key: kCGImagePropertyIPTCProgramVersion.string, value: newValue) }
    }
    
    public var objectCycle: String? {
        get { getValue(key: kCGImagePropertyIPTCObjectCycle.string) }
        set { setValue(key: kCGImagePropertyIPTCObjectCycle.string, value: newValue) }
    }
    
    public var byline: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCByline.string) }
        set { setValue(key: kCGImagePropertyIPTCByline.string, value: newValue) }
    }
    
    public var bylineTitle: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCBylineTitle.string) }
        set { setValue(key: kCGImagePropertyIPTCBylineTitle.string, value: newValue) }
    }
    
    public var city: String? {
        get { getValue(key: kCGImagePropertyIPTCCity.string) }
        set { setValue(key: kCGImagePropertyIPTCCity.string, value: newValue) }
    }
    
    public var subLocation: String? {
        get { getValue(key: kCGImagePropertyIPTCSubLocation.string) }
        set { setValue(key: kCGImagePropertyIPTCSubLocation.string, value: newValue) }
    }
    
    public var provinceState: String? {
        get { getValue(key: kCGImagePropertyIPTCProvinceState.string) }
        set { setValue(key: kCGImagePropertyIPTCProvinceState.string, value: newValue) }
    }
    
    public var countryPrimaryLocationCode: String? {
        get { getValue(key: kCGImagePropertyIPTCCountryPrimaryLocationCode.string) }
        set { setValue(key: kCGImagePropertyIPTCCountryPrimaryLocationCode.string, value: newValue) }
    }
    
    public var countryPrimaryLocationName: String? {
        get { getValue(key: kCGImagePropertyIPTCCountryPrimaryLocationName.string) }
        set { setValue(key: kCGImagePropertyIPTCCountryPrimaryLocationName.string, value: newValue) }
    }
    
    public var originalTransmissionReference: String? {
        get { getValue(key: kCGImagePropertyIPTCOriginalTransmissionReference.string) }
        set { setValue(key: kCGImagePropertyIPTCOriginalTransmissionReference.string, value: newValue) }
    }
    
    public var headline: String? {
        get { getValue(key: kCGImagePropertyIPTCHeadline.string) }
        set { setValue(key: kCGImagePropertyIPTCHeadline.string, value: newValue) }
    }
    
    public var credit: String? {
        get { getValue(key: kCGImagePropertyIPTCCredit.string) }
        set { setValue(key: kCGImagePropertyIPTCCredit.string, value: newValue) }
    }
    
    public var source: String? {
        get { getValue(key: kCGImagePropertyIPTCSource.string) }
        set { setValue(key: kCGImagePropertyIPTCSource.string, value: newValue) }
    }
    
    public var copyrightNotice: String? {
        get { getValue(key: kCGImagePropertyIPTCCopyrightNotice.string) }
        set { setValue(key: kCGImagePropertyIPTCCopyrightNotice.string, value: newValue) }
    }
    
    public var contact: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCContact.string) }
        set { setValue(key: kCGImagePropertyIPTCContact.string, value: newValue) }
    }
    
    public var captionAbstract: String? {
        get { getValue(key: kCGImagePropertyIPTCCaptionAbstract.string) }
        set { setValue(key: kCGImagePropertyIPTCCaptionAbstract.string, value: newValue) }
    }
    
    public var writerEditor: Array<String>? {
        get { getValue(key: kCGImagePropertyIPTCWriterEditor.string) }
        set { setValue(key: kCGImagePropertyIPTCWriterEditor.string, value: newValue) }
    }
    
    public var imageType: String? {
        get { getValue(key: kCGImagePropertyIPTCImageType.string) }
        set { setValue(key: kCGImagePropertyIPTCImageType.string, value: newValue) }
    }
    
    public var imageOrientation: String? {
        get { getValue(key: kCGImagePropertyIPTCImageOrientation.string) }
        set { setValue(key: kCGImagePropertyIPTCImageOrientation.string, value: newValue) }
    }
    
    public var languageIdentifier: String? {
        get { getValue(key: kCGImagePropertyIPTCLanguageIdentifier.string) }
        set { setValue(key: kCGImagePropertyIPTCLanguageIdentifier.string, value: newValue) }
    }
    
    public var starRating: Double? {
        get { getValue(key: kCGImagePropertyIPTCStarRating.string) }
        set { setValue(key: kCGImagePropertyIPTCStarRating.string, value: newValue) }
    }
    
    public var rightsUsageTerms: String? {
        get { getValue(key: kCGImagePropertyIPTCRightsUsageTerms.string) }
        set { setValue(key: kCGImagePropertyIPTCRightsUsageTerms.string, value: newValue) }
    }
    
    public var scene: String? {
        get { getValue(key: kCGImagePropertyIPTCScene.string) }
        set { setValue(key: kCGImagePropertyIPTCScene.string, value: newValue) }
    }
}
