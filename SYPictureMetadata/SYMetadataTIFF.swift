//
//  SYMetadataTIFF.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 20/01/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataTIFF : SYMetadataBase {

    // MARK: Types
    @objc public enum PhotometricInterpretation : Int, CaseIterable {
        case MINISWHITE    = 0
        case MINISBLACK    = 1
        case RGB           = 2
        case PALETTE       = 3
        case MASK          = 4
        case SEPARATED     = 5
        case YCBCR         = 6
        case CIELAB        = 8
        case ICCLAB        = 9
        case ITULAB        = 10
        case LOGL          = 32844
        case LOGLUV        = 32845
    }

    // MARK: Values
    public var compression: String? {
        get { getValue(key: kCGImagePropertyTIFFCompression.string) }
        set { setValue(key: kCGImagePropertyTIFFCompression.string, value: newValue) }
    }

    public var photometricInterpretation: PhotometricInterpretation? {
        get { getValue(key: kCGImagePropertyTIFFPhotometricInterpretation.string) }
        set { setValue(key: kCGImagePropertyTIFFPhotometricInterpretation.string, value: newValue) }
    }

    public var documentName: String? {
        get { getValue(key: kCGImagePropertyTIFFDocumentName.string) }
        set { setValue(key: kCGImagePropertyTIFFDocumentName.string, value: newValue) }
    }

    public var imageDescription: String? {
        get { getValue(key: kCGImagePropertyTIFFImageDescription.string) }
        set { setValue(key: kCGImagePropertyTIFFImageDescription.string, value: newValue) }
    }

    public var make: String? {
        get { getValue(key: kCGImagePropertyTIFFMake.string) }
        set { setValue(key: kCGImagePropertyTIFFMake.string, value: newValue) }
    }

    public var model: String? {
        get { getValue(key: kCGImagePropertyTIFFModel.string) }
        set { setValue(key: kCGImagePropertyTIFFModel.string, value: newValue) }
    }

    public var orientation: CGImagePropertyOrientation? {
        get { getValue(key: kCGImagePropertyTIFFOrientation.string) }
        set { setValue(key: kCGImagePropertyTIFFOrientation.string, value: newValue) }
    }

    public var xResolution: Int? {
        get { getValue(key: kCGImagePropertyTIFFXResolution.string) }
        set { setValue(key: kCGImagePropertyTIFFXResolution.string, value: newValue) }
    }

    public var yResolution: Int? {
        get { getValue(key: kCGImagePropertyTIFFYResolution.string) }
        set { setValue(key: kCGImagePropertyTIFFYResolution.string, value: newValue) }
    }

    public var resolutionUnit: Int? {
        get { getValue(key: kCGImagePropertyTIFFResolutionUnit.string) }
        set { setValue(key: kCGImagePropertyTIFFResolutionUnit.string, value: newValue) }
    }

    public var software: String? {
        get { getValue(key: kCGImagePropertyTIFFSoftware.string) }
        set { setValue(key: kCGImagePropertyTIFFSoftware.string, value: newValue) }
    }

    public var transferFunction: Array<Int>? {
        get { getValue(key: kCGImagePropertyTIFFTransferFunction.string) }
        set { setValue(key: kCGImagePropertyTIFFTransferFunction.string, value: newValue) }
    }

    public var dateTime: String? {
        get { getValue(key: kCGImagePropertyTIFFDateTime.string) }
        set { setValue(key: kCGImagePropertyTIFFDateTime.string, value: newValue) }
    }

    public var artist: String? {
        get { getValue(key: kCGImagePropertyTIFFArtist.string) }
        set { setValue(key: kCGImagePropertyTIFFArtist.string, value: newValue) }
    }

    public var hostComputer: String? {
        get { getValue(key: kCGImagePropertyTIFFHostComputer.string) }
        set { setValue(key: kCGImagePropertyTIFFHostComputer.string, value: newValue) }
    }

    public var copyright: String? {
        get { getValue(key: kCGImagePropertyTIFFCopyright.string) }
        set { setValue(key: kCGImagePropertyTIFFCopyright.string, value: newValue) }
    }

    public var whitePoint: Array<Int>? {
        get { getValue(key: kCGImagePropertyTIFFWhitePoint.string) }
        set { setValue(key: kCGImagePropertyTIFFWhitePoint.string, value: newValue) }
    }

    public var primaryChromaticities: Array<Int>? {
        get { getValue(key: kCGImagePropertyTIFFPrimaryChromaticities.string) }
        set { setValue(key: kCGImagePropertyTIFFPrimaryChromaticities.string, value: newValue) }
    }

    public var tileWidth: Int? {
        get { getValue(key: kCGImagePropertyTIFFTileWidth.string) }
        set { setValue(key: kCGImagePropertyTIFFTileWidth.string, value: newValue) }
    }

    public var tileLength: Int? {
        get { getValue(key: kCGImagePropertyTIFFTileLength.string) }
        set { setValue(key: kCGImagePropertyTIFFTileLength.string, value: newValue) }
    }
}


