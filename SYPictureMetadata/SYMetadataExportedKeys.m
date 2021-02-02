//
//  SYMetadataExportedKeys.h
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

#import "SYMetadataExportedKeys.h"

// not defined in ImageIO but still read by iOS
CFStringRef const kSYImagePropertyPictureStyle                  = CFSTR("{PictureStyle}");
CFStringRef const kSYImagePropertyExifAuxAutoFocusInfo          = CFSTR("AFInfo");
CFStringRef const kSYImagePropertyExifAuxImageStabilization     = CFSTR("ImageStabilization");
CFStringRef const kSYImagePropertyCIFFMaxAperture               = CFSTR("MaxAperture");
CFStringRef const kSYImagePropertyCIFFMinAperture               = CFSTR("MinAperture");
CFStringRef const kSYImagePropertyCIFFUniqueModelID             = CFSTR("UniqueModelID");
