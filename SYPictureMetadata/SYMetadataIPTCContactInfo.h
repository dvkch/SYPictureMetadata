//
//  SYMetadataIPTCContactInfo.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadataIPTCContactInfo : SYMetadataBase

@property (nonatomic, copy, readonly) NSString  *city;
@property (nonatomic, copy, readonly) NSString  *country;
@property (nonatomic, copy, readonly) NSString  *address;
@property (nonatomic, copy, readonly) NSString  *postalCode;
@property (nonatomic, copy, readonly) NSString  *stateProvince;
@property (nonatomic, copy, readonly) NSString  *emails;
@property (nonatomic, copy, readonly) NSString  *phones;
@property (nonatomic, copy, readonly) NSString  *webURLs;

@end
