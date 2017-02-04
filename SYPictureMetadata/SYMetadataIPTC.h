//
//  SYMetadataIPTC.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"
#import "SYMetadataIPTCContactInfo.h"

@interface SYMetadataIPTC : SYMetadataBase

@property (nonatomic, copy, readonly) NSString              *objectTypeReference;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *objectAttributeReference;
@property (nonatomic, copy, readonly) NSString              *objectName;
@property (nonatomic, copy, readonly) NSString              *editStatus;
@property (nonatomic, copy, readonly) NSString              *editorialUpdate;
@property (nonatomic, copy, readonly) NSString              *urgency;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *subjectReference;
@property (nonatomic, copy, readonly) NSString              *category;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *supplementalCategory;
@property (nonatomic, copy, readonly) NSString              *fixtureIdentifier;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *keywords;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *contentLocationCode;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *contentLocationName;
@property (nonatomic, copy, readonly) NSString              *releaseDate;
@property (nonatomic, copy, readonly) NSString              *releaseTime;
@property (nonatomic, copy, readonly) NSString              *expirationDate;
@property (nonatomic, copy, readonly) NSString              *expirationTime;
@property (nonatomic, copy, readonly) NSString              *specialInstructions;
@property (nonatomic, copy, readonly) NSString              *actionAdvised;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *referenceService;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *referenceDate;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *referenceNumber;
@property (nonatomic, copy, readonly) NSString              *dateCreated;
@property (nonatomic, copy, readonly) NSString              *timeCreated;
@property (nonatomic, copy, readonly) NSString              *digitalCreationDate;
@property (nonatomic, copy, readonly) NSString              *digitalCreationTime;
@property (nonatomic, copy, readonly) NSString              *originatingProgram;
@property (nonatomic, copy, readonly) NSString              *programVersion;
@property (nonatomic, copy, readonly) NSString              *objectCycle;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *byline;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *bylineTitle;
@property (nonatomic, copy, readonly) NSString              *city;
@property (nonatomic, copy, readonly) NSString              *subLocation;
@property (nonatomic, copy, readonly) NSString              *provinceState;
@property (nonatomic, copy, readonly) NSString              *countryPrimaryLocationCode;
@property (nonatomic, copy, readonly) NSString              *countryPrimaryLocationName;
@property (nonatomic, copy, readonly) NSString              *originalTransmissionReference;
@property (nonatomic, copy, readonly) NSString              *headline;
@property (nonatomic, copy, readonly) NSString              *credit;
@property (nonatomic, copy, readonly) NSString              *source;
@property (nonatomic, copy, readonly) NSString              *copyrightNotice;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *contact;
@property (nonatomic, copy, readonly) NSString              *captionAbstract;
@property (nonatomic, copy, readonly) NSArray <NSString *>  *writerEditor;
@property (nonatomic, copy, readonly) NSString              *imageType;
@property (nonatomic, copy, readonly) NSString              *imageOrientation;
@property (nonatomic, copy, readonly) NSString              *languageIdentifier;
@property (nonatomic, copy, readonly) NSNumber              *starRating;
@property (nonatomic, copy, readonly) SYMetadataIPTCContactInfo *creatorContactInfo;
@property (nonatomic, copy, readonly) NSString              *rightsUsageTerms;
@property (nonatomic, copy, readonly) NSString              *scene;

@end
