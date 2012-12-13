//
//  SYPicture.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYPictureDictionaryEXIF.h"
#import "SYPictureDictionaryTIFF.h"

@interface SYPicture : NSObject {
@private
    NSDictionary *_metadata;
    NSURL *_assetURL;
    NSString* _absolutePath;
}

-(SYPicture*)initWithAssetURL:(NSURL*)assetURL;
-(SYPicture*)initWithAbsolutePath:(NSString*)absolutePath;

-(SYPictureDictionaryTIFF*)metadataTiff;
-(SYPictureDictionaryEXIF*)metadataExif;

@end
