//
//  SYMetadataExportedKeys.h
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 07/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation

// not defined in ImageIO but still read by iOS
let kSYImagePropertyPictureStyle: CFString              = "{PictureStyle}"      as CFString
let kSYImagePropertyExifAuxAutoFocusInfo: CFString      = "AFInfo"              as CFString
let kSYImagePropertyExifAuxImageStabilization: CFString = "ImageStabilization"  as CFString
let kSYImagePropertyCIFFMaxAperture: CFString           = "MaxAperture"         as CFString
let kSYImagePropertyCIFFMinAperture: CFString           = "MinAperture"         as CFString
let kSYImagePropertyCIFFUniqueModelID: CFString         = "UniqueModelID"       as CFString
