//
//  SYMetadata8BIM.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@interface SYMetadata8BIM : SYMetadataBase

@property (nonatomic, copy, readonly) NSArray <NSString *>  *layerNames;
@property (nonatomic, copy, readonly) NSNumber              *version;

@end
