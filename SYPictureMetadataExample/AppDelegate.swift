//
//  AppDelegate.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 20/01/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import UIKit
import SYPictureMetadata

// TODO: add tests for "unread keys" (keys present in original dictionary but not read. only available in test scheme!)
// TODO: use property wrappers when they can reference self
// TODO: print stats of untested but supported keys (needs property wrappers?)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        testAddIPTC()
        testStripAll()
        return true
    }
    
    // README Examples
    func testAddIPTC() {
        let imageURL = TestFile.iptc2.url!
        
        // load metadata from original file (please handle errors, the type is SYMetadata.Error)
        let metadata = try! SYMetadata(fileURL: imageURL)
        
        // create IPTC container if not present
        if (metadata.metadataIPTC == nil) {
            metadata.metadataIPTC = SYMetadataIPTC()
        }
        
        // edit metadata
        metadata.metadataIPTC?.keywords  = ["Some test keywords", "added by SYMetadata example app"];
        metadata.metadataIPTC?.city      = "Lyon";
        metadata.metadataIPTC?.credit    = "© Me 2017";
        
        // create new image data with original image data and edited metadata
        let originalImageData = try! Data(contentsOf: imageURL)
        let imageDataWithMetadata = try! metadata.apply(to: originalImageData)
        
        // log the delta in file size
        print("File size delta:", imageDataWithMetadata.count - originalImageData.count);
        // File size delta: 60325

        // load metadata for newly cerated image
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithMetadata)
        
        // log the differences between files
        print("Differences:\n", reloadedMetadata.originalDictionary.metadataDifferences(from: metadata.originalDictionary, includeValuesInDiff: true).jsonString)
        // Differences:
        //  {
        //   "{Exif}" : {
        //     "ShutterSpeedValue" : "Updated: 8.643856 -> 8.643855995239512"
        //   },
        //   "{IPTC}" : {
        //     "City" : "Added: Lyon",
        //     "Credit" : "Added: © Me 2017",
        //     "Keywords" : "Updated: beach, baywatch, LA, sunset -> Some test keywords, added by SYMetadata example app"
        //   },
        //   "{JFIF}" : {
        //     "DensityUnit" : "Added: 0",
        //     "JFIFVersion" : "Added: 1, 0, 1",
        //     "XDensity" : "Added: 72",
        //     "YDensity" : "Added: 72"
        //   }
        // }
    }
    
    func testStripAll() {
        let imageURL = TestFile.iptc2.url!
        
        // load metadata from original file (please handle errors, the type is SYMetadata.Error)
        let metadata = try! SYMetadata(fileURL: imageURL)
        
        // create new image data with original image data and strip all metadata
        let originalImageData = try! Data(contentsOf: imageURL)
        let imageDataWithoutMetadata = try! SYMetadata.stripAllMetadata(from: originalImageData)
        
        // log the delta in file size
        print("File size delta:", imageDataWithoutMetadata.count - originalImageData.count);
        // File size delta: 73491

        // load metadata for newly cerated image
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithoutMetadata)
        
        // log the differences between files
        print("Differences:\n", reloadedMetadata.originalDictionary.metadataDifferences(from: metadata.originalDictionary, includeValuesInDiff: false).jsonString)
        // Differences:
        //  {
        //   "{Exif}" : {
        //     "ApertureValue" : "Removed",
        //     "ComponentsConfiguration" : "Removed",
        //     "CompressedBitsPerPixel" : "Removed",
        //     "Contrast" : "Removed",
        //     "CustomRendered" : "Removed",
        //     "DateTimeDigitized" : "Removed",
        //     "DateTimeOriginal" : "Removed",
        //     "DigitalZoomRatio" : "Removed",
        //     "ExifVersion" : "Removed",
        //     "ExposureBiasValue" : "Removed",
        //     "ExposureMode" : "Removed",
        //     "ExposureProgram" : "Removed",
        //     "ExposureTime" : "Removed",
        //     "FileSource" : "Removed",
        //     "Flash" : "Removed",
        //     "FlashPixVersion" : "Removed",
        //     "FNumber" : "Removed",
        //     "FocalLength" : "Removed",
        //     "FocalLenIn35mmFilm" : "Removed",
        //     "GainControl" : "Removed",
        //     "ISOSpeedRatings" : "Removed",
        //     "LightSource" : "Removed",
        //     "MaxApertureValue" : "Removed",
        //     "MeteringMode" : "Removed",
        //     "Saturation" : "Removed",
        //     "SceneCaptureType" : "Removed",
        //     "SceneType" : "Removed",
        //     "SensingMethod" : "Removed",
        //     "Sharpness" : "Removed",
        //     "ShutterSpeedValue" : "Removed",
        //     "WhiteBalance" : "Removed"
        //   },
        //   "{IPTC}" : {
        //     "Byline" : "Removed",
        //     "BylineTitle" : "Removed",
        //     "Caption\/Abstract" : "Removed",
        //     "CopyrightNotice" : "Removed",
        //     "DateCreated" : "Removed",
        //     "DigitalCreationDate" : "Removed",
        //     "DigitalCreationTime" : "Removed",
        //     "Keywords" : "Removed",
        //     "ObjectName" : "Removed",
        //     "TimeCreated" : "Removed"
        //   },
        //   "{JFIF}" : {
        //     "DensityUnit" : "Added",
        //     "IsProgressive" : "Removed",
        //     "JFIFVersion" : "Added",
        //     "XDensity" : "Added",
        //     "YDensity" : "Added"
        //   },
        //   "{TIFF}" : {
        //     "Artist" : "Removed",
        //     "Copyright" : "Removed",
        //     "DateTime" : "Removed",
        //     "ImageDescription" : "Removed",
        //     "Make" : "Removed",
        //     "Model" : "Removed",
        //     "PhotometricInterpretation" : "Removed",
        //     "ResolutionUnit" : "Removed",
        //     "Software" : "Removed",
        //     "XResolution" : "Removed",
        //     "YResolution" : "Removed"
        //   },
        //   "DPIHeight" : "Removed",
        //   "DPIWidth" : "Removed"
        // }

        // log kept metadata
        print("Kept metadata:\n", reloadedMetadata.originalDictionary.jsonString)
        // Kept metadata:
        //  {
        //   "{Exif}" : {
        //     "ColorSpace" : 1,
        //     "PixelXDimension" : 1920,
        //     "PixelYDimension" : 1080
        //   },
        //   "{JFIF}" : {
        //     "DensityUnit" : 0,
        //     "JFIFVersion" : [
        //       1,
        //       0,
        //       1
        //     ],
        //     "XDensity" : 72,
        //     "YDensity" : 72
        //   },
        //   "{TIFF}" : {
        //     "Orientation" : 1
        //   },
        //   "ColorModel" : "RGB",
        //   "Depth" : 8,
        //   "Orientation" : 1,
        //   "PixelHeight" : 1080,
        //   "PixelWidth" : 1920,
        //   "ProfileName" : "sRGB IEC61966-2.1"
        // }
    }
}

