//
//  SYMetadataExifAux.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadataExifAux : SYMetadataBase

@property (readonly, nonatomic, getter = getLensInfo)           NSArray*    lensInfo;
@property (readonly, nonatomic, getter = getLensModel)          NSString*   lensModel;
@property (readonly, nonatomic, getter = getSerialNumber)       NSString*   serialNumber;
@property (readonly, nonatomic, getter = getLensID)             NSNumber*   lensID;
@property (readonly, nonatomic, getter = getLensSerialNumber)   NSString*   lensSerialNumber;
@property (readonly, nonatomic, getter = getImageNumber)        NSNumber*   imageNumber;
@property (readonly, nonatomic, getter = getFlashCompensation)  NSObject*   flashCompensation;
@property (readonly, nonatomic, getter = getOwnerName)          NSString*   ownerName;
@property (readonly, nonatomic, getter = getFirmware)           NSObject*   firmware;

@end
