//
//  SYMetadataGPS.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

// TODO: use enum for refs instead of strings

@interface SYMetadataGPS : SYMetadataBase

@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *version;
@property (nonatomic, copy, readonly) NSString  *latitudeRef;
@property (nonatomic, copy, readonly) NSNumber  *latitude;
@property (nonatomic, copy, readonly) NSString  *longitudeRef;
@property (nonatomic, copy, readonly) NSNumber  *longitude;
@property (nonatomic, copy, readonly) NSNumber  *altitudeRef;
@property (nonatomic, copy, readonly) NSNumber  *altitude;
@property (nonatomic, copy, readonly) NSString  *timeStamp;
@property (nonatomic, copy, readonly) NSString  *satellites;
@property (nonatomic, copy, readonly) NSString  *status;
@property (nonatomic, copy, readonly) NSString  *measureMode;
@property (nonatomic, copy, readonly) NSNumber  *dop;
@property (nonatomic, copy, readonly) NSString  *speedRef;
@property (nonatomic, copy, readonly) NSNumber  *speed;
@property (nonatomic, copy, readonly) NSString  *trackRef;
@property (nonatomic, copy, readonly) NSNumber  *track;
@property (nonatomic, copy, readonly) NSString  *imgDirectionRef;
@property (nonatomic, copy, readonly) NSNumber  *imgDirection;
@property (nonatomic, copy, readonly) NSString  *mapDatum;
@property (nonatomic, copy, readonly) NSString  *destLatitudeRef;
@property (nonatomic, copy, readonly) NSNumber  *destLatitude;
@property (nonatomic, copy, readonly) NSString  *destLongitudeRef;
@property (nonatomic, copy, readonly) NSNumber  *destLongitude;
@property (nonatomic, copy, readonly) NSString  *destBearingRef;
@property (nonatomic, copy, readonly) NSNumber  *destBearing;
@property (nonatomic, copy, readonly) NSString  *destDistanceRef;
@property (nonatomic, copy, readonly) NSNumber  *destDistance;
@property (nonatomic, copy, readonly) NSString  *processingMethod;
@property (nonatomic, copy, readonly) NSObject  *areaInformation;
@property (nonatomic, copy, readonly) NSString  *dateStamp;
@property (nonatomic, copy, readonly) NSNumber  *differental;
@property (nonatomic, copy, readonly) NSNumber  *hPositioningError;

@end
