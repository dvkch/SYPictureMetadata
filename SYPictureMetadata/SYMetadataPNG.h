//
//  SYMetadataPNG.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/16/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"
#import <ImageIO/ImageIO.h>

typedef enum : NSUInteger {
    SYMetadataPNGsRGBIntent_Perceptual              = 0,
    SYMetadataPNGsRGBIntent_RelativeColorimetric    = 1,
    SYMetadataPNGsRGBIntent_Saturation              = 2,
    SYMetadataPNGsRGBIntent_AbsoluteColorimetric    = 3,
} SYMetadataPNGsRGBIntent;


typedef enum : NSUInteger {
    SYMetadataPNGCompressionFilter_NoFilters    = IMAGEIO_PNG_NO_FILTERS,
    SYMetadataPNGCompressionFilter_None         = IMAGEIO_PNG_FILTER_NONE,
    SYMetadataPNGCompressionFilter_Sub          = IMAGEIO_PNG_FILTER_SUB,
    SYMetadataPNGCompressionFilter_Up           = IMAGEIO_PNG_FILTER_UP,
    SYMetadataPNGCompressionFilter_Avg          = IMAGEIO_PNG_FILTER_AVG,
    SYMetadataPNGCompressionFilter_Paeth        = IMAGEIO_PNG_FILTER_PAETH,
    SYMetadataPNGCompressionFilter_All          = IMAGEIO_PNG_ALL_FILTERS,
} SYMetadataPNGCompressionFilter;


@interface SYMetadataPNG : SYMetadataBase

@property (nonatomic, copy, readonly) NSNumber              *gamma;
@property (nonatomic, copy, readonly) NSNumber              *interlaceType;
@property (nonatomic, copy, readonly) NSNumber              *xPixelsPerMeter;
@property (nonatomic, copy, readonly) NSNumber              *yPixelsPerMeter;
@property (nonatomic, copy, readonly) NSNumber              *sRGBIntent;
@property (nonatomic, copy, readonly) NSArray <NSNumber *>  *chromaticities;
@property (nonatomic, copy, readonly) NSString              *author;
@property (nonatomic, copy, readonly) NSString              *copyright;
@property (nonatomic, copy, readonly) NSString              *creationTime;
@property (nonatomic, copy, readonly) NSString              *descr;
@property (nonatomic, copy, readonly) NSString              *modificationTime;
@property (nonatomic, copy, readonly) NSString              *software;
@property (nonatomic, copy, readonly) NSString              *title;
@property (nonatomic, copy, readonly) NSNumber              *loopCount;
@property (nonatomic, copy, readonly) NSNumber              *delayTime;
@property (nonatomic, copy, readonly) NSNumber              *unclampedDelayTime;
@property (nonatomic, copy, readonly) NSNumber              *compressionFilter;

@end
