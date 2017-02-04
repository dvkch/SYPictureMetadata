//
//  SYMetadataBase.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

#define SYPaste1(a,b)                   a##b
#define SYPaste(a,b)                    SYPaste1(a,b)
#define SYStringSel(sel)                NSStringFromSelector(@selector(sel))

// keys not available in public header, but still read by iOS
extern CFStringRef const kSYImagePropertyExifAuxAutoFocusInfo;
extern CFStringRef const kSYImagePropertyExifAuxImageStabilization;
extern CFStringRef const kSYImagePropertyCIFFMaxAperture;
extern CFStringRef const kSYImagePropertyCIFFMinAperture;
extern CFStringRef const kSYImagePropertyCIFFUniqueModelID;
extern CFStringRef const kSYImagePropertyPictureStyle;

@interface MTLValueTransformer (SY)
+ (instancetype)sy_nonZeroIntegerValueTransformer;
@end

@interface SYMetadataBase : MTLModel <MTLJSONSerializing>

- (NSDictionary *)generatedDictionary;

@end
