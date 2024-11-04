//
//  SYPictureMetadataTests.swift
//  SYPictureMetadataTests
//
//  Created by Stanislas Chevallier on 09/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import XCTest
@testable import SYPictureMetadata
@testable import SYPictureMetadataTestAssets

var readKeys = Set<String>()
var writtenKeys = Set<String>()
var availableKeys = Set<String>()

class SYPictureMetadataTests: XCTestCase {

    // MARK: Hooks
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    override class func tearDown() {
        let supported = MetadataKeys.supported.read().count
        let ratioReadAvailable = Int(Float(readKeys.count) / Float(availableKeys.count) * 100)
        let ratioReadSupported = Int(Float(readKeys.count) / Float(supported) * 100)
        let ratioWrittenSupported = Int(Float(writtenKeys.count) / Float(supported) * 100)
        
        print("STATS :")
        print(" - read \(ratioReadAvailable)% of keys available in test files")
        print(" - read \(ratioReadSupported)% of supported keys")
        print(" - wrote \(ratioWrittenSupported)% of supported keys")
    }
    
    func keepStats(_ metadatas: [SYMetadata]) {
        metadatas.forEach { (metadata) in
            readKeys.formUnion(metadata.allDebugReadKeys)
            writtenKeys.formUnion(metadata.allDebugWrittenKeys)
            availableKeys.formUnion(metadata.originalDictionary.allKeyPaths)
        }
    }

    // MARK: TestFile
    func testFileListCompleteAndAvailable() throws {
        // All files are available
        TestFile.allCases.forEach { file in
            XCTAssertNotNil(try? file.read(), "Missing file \(file.rawValue)")
        }

        // File list is complete
        let knownFiles = TestFile.allCases.map(\.url.standardizedFileURL.path).sorted()
        let parentDir = TestFile.nikon.url.deletingLastPathComponent()
        let availableFiles = try! FileManager.default.contentsOfDirectory(at: parentDir, includingPropertiesForKeys: nil, options: .skipsSubdirectoryDescendants)
            .map { $0.standardizedFileURL.path }
            .sorted()
        XCTAssertEqual(availableFiles, knownFiles)
    }
    
    // MARK: Helpers
    func printJSON(_ metadata: SYMetadataBase?) {
        var options = JSONSerialization.WritingOptions.prettyPrinted
        if #available(iOS 11.0, *) {
            options.insert(.sortedKeys)
        }
        let dictionary = metadata?.originalDictionary ?? [:]
        print(dictionary.jsonString)
    }
    
    // MARK: Reading metadata
    func testMetadata() throws {
        let metadata = try! TestFile.iptc.readMetadata()
        XCTAssertNotNil(metadata)
        XCTAssertEqual(metadata.colorModel, .rgb)
        XCTAssertEqual(metadata.depth, 8)
        XCTAssertEqual(metadata.dpiWidth, 72)
        XCTAssertEqual(metadata.dpiHeight, 72)
        XCTAssertEqual(metadata.pixelWidth, 343)
        XCTAssertEqual(metadata.pixelHeight, 576)
        XCTAssertEqual(metadata.profileName, "sRGB IEC61966-2.1")
        XCTAssertEqual(metadata.orientation, .up)

        // stats
        keepStats([metadata])
    }

    func test8BIM() throws {
        let metadata = try! TestFile.eightBim.readMetadata()
        XCTAssertNotNil(metadata.metadata8BIM)
        XCTAssertEqual(metadata.metadata8BIM?.version, 1)

        // stats
        keepStats([metadata])
    }
    
    func testAppleGPS() throws {
        let metadata = try! TestFile.appleGPS.readMetadata()

        let expectedAppleKeys = ["1", "2", "3", "4", "5", "6", "7", "8", "14", "17", "20"]
        XCTAssertNotNil(metadata.metadataMakerApple)
        XCTAssertEqual(Array((metadata.metadataMakerApple?.originalDictionary ?? [:]).keys).sorted(), expectedAppleKeys.sorted())

        XCTAssertNotNil(metadata.metadataGPS)
        XCTAssertEqual(metadata.metadataGPS?.altitude, 269.21224489795918)
        XCTAssertEqual(metadata.metadataGPS?.altitudeRef, .aboveSeaLevel)
        XCTAssertEqual(metadata.metadataGPS?.dateStamp, "2017:01:16")
        XCTAssertEqual(metadata.metadataGPS?.destBearing, 338.45418326693226)
        XCTAssertEqual(metadata.metadataGPS?.destBearingRef, .trueDirection)
        XCTAssertEqual(metadata.metadataGPS?.hPositioningError, 10)
        XCTAssertEqual(metadata.metadataGPS?.imgDirection, 338.45418326693226)
        XCTAssertEqual(metadata.metadataGPS?.imgDirectionRef, .trueDirection)
        XCTAssertEqual(metadata.metadataGPS?.latitude, 50.048949999999998)
        XCTAssertEqual(metadata.metadataGPS?.latitudeRef, .north)
        XCTAssertEqual(metadata.metadataGPS?.longitude, 14.43812)
        XCTAssertEqual(metadata.metadataGPS?.longitudeRef, .east)
        XCTAssertEqual(metadata.metadataGPS?.speed, 1.29)
        XCTAssertEqual(metadata.metadataGPS?.speedRef, .kilometersPerHour)
        XCTAssertEqual(metadata.metadataGPS?.timeStamp, "09:02:18")

        // stats
        keepStats([metadata])
    }

    func testCanon() throws {
        let metadata = try! TestFile.canon.readMetadata()
        XCTAssertNotNil(metadata.metadataMakerCanon)
        XCTAssertEqual(metadata.metadataMakerCanon?.continuousDrive, .single)
        XCTAssertEqual(metadata.metadataMakerCanon?.lensModel, "EF-S18-135mm f/3.5-5.6 IS STM")
        XCTAssertEqual(metadata.metadataMakerCanon?.maxAperture, 4.3620309306610308)
        XCTAssertEqual(metadata.metadataMakerCanon?.minAperture, 28.508758980490853)
        XCTAssertEqual(metadata.metadataMakerCanon?.uniqueModelID, 2147484453)
        XCTAssertEqual(metadata.metadataMakerCanon?.whiteBalance, .auto)

        // stats
        keepStats([metadata])
    }

    func testCIFF() throws {
        let metadata = try! TestFile.ciff.readMetadata()
        XCTAssertNotNil(metadata.metadataCIFF)
        XCTAssertEqual(metadata.metadataCIFF?.continuousDrive, .single)
        XCTAssertEqual(metadata.metadataCIFF?.descr, "High definition CCD image")
        XCTAssertEqual(metadata.metadataCIFF?.focusMode, .aiServoAF)
        XCTAssertEqual(metadata.metadataCIFF?.imageFileName, "CRW_5082.CRW")
        XCTAssertEqual(metadata.metadataCIFF?.imageName, "CRW:High definition CCD image")
        XCTAssertEqual(metadata.metadataCIFF?.maxAperture, 2.8903616139540933)
        XCTAssertEqual(metadata.metadataCIFF?.minAperture, 8)
        XCTAssertEqual(metadata.metadataCIFF?.measuredEV, 0.375)
        XCTAssertEqual(metadata.metadataCIFF?.recordID, 0)
        XCTAssertEqual(metadata.metadataCIFF?.uniqueModelID, 20512768)
        XCTAssertEqual(metadata.metadataCIFF?.whiteBalance, .flash)

        // stats
        keepStats([metadata])
    }

    func testDNG() throws {
        let metadata = try! TestFile.dng.readMetadata()
        XCTAssertNotNil(metadata.metadataDNG)
        XCTAssertEqual(metadata.metadataDNG?.version, [1, 4])
        XCTAssertEqual(metadata.metadataDNG?.backwardVersion, [1, 1])
        XCTAssertEqual(metadata.metadataDNG?.uniqueCameraModel, "Nikon D5300")
        XCTAssertEqual(metadata.metadataDNG?.blackLevel, [150,  150,  150,  150])
        XCTAssertEqual(metadata.metadataDNG?.whiteLevel, [3972])
        XCTAssertEqual(metadata.metadataDNG?.calibrationIlluminant1, .standardLightA)
        XCTAssertEqual(metadata.metadataDNG?.calibrationIlluminant2, .d65)
        XCTAssertEqual(metadata.metadataDNG?.colorMatrix1, [
            0.96719998121261597, -0.41530001163482666, 0.006399999838322401,
            -0.41200000047683716, 1.1851999759674072, 0.25709998607635498,
            -0.093999996781349182, 0.18119999766349792, 0.78939998149871826
        ])
        XCTAssertEqual(metadata.metadataDNG?.colorMatrix2, [
            0.69880002737045288, -0.13840000331401825, -0.071400001645088196,
            -0.56309998035430908, 1.340999960899353,  0.24469999969005585,
            -0.148499995470047, 0.22040000557899475, 0.73180001974105835
        ])
        XCTAssertEqual(metadata.metadataDNG?.asShotNeutral, [0.52459001541137695,  1,  0.60807597637176514])
        XCTAssertEqual(metadata.metadataDNG?.baselineExposure, 0.34999999403953552)
        XCTAssertEqual(metadata.metadataDNG?.baselineNoise, 1)
        XCTAssertEqual(metadata.metadataDNG?.baselineSharpness, 1)
        XCTAssertEqual(metadata.metadataDNG?.cameraCalibrationSignature, "com.adobe")
        XCTAssertEqual(metadata.metadataDNG?.profileCalibrationSignature, "com.adobe")
        XCTAssertEqual(metadata.metadataDNG?.noiseProfile, [
            0.00055516289005874719,  6.6049619854829273e-06,  0.0005038849469748989,
            5.4925237574105637e-06,  0.00057822690165560385,  7.383049862396093e-06
        ])

        // stats
        keepStats([metadata])
    }

    func testGIF() throws {
        let metadata = try! TestFile.gif.readMetadata()
        XCTAssertNotNil(metadata.metadataGIF)
        XCTAssertEqual(metadata.metadataGIF?.delayTime, 0.5)
        XCTAssertEqual(metadata.metadataGIF?.unclampedDelayTime, 0.5)

        // stats
        keepStats([metadata])
    }

    func testIPTC() throws {
        let metadata = try! TestFile.iptc.readMetadata()

        XCTAssertNotNil(metadata.metadataIPTC)
        XCTAssertEqual(metadata.metadataIPTC?.objectName, "drp2115036d")
        XCTAssertEqual(metadata.metadataIPTC?.keywords, [
            "padlock", "lock", "security", "secure", "concepts", "concept", "conceptual", "emotion", "emotional", "emotions", "affection", "love",
            "close up", "close-up", "outdoors", "outdoor", "outside", "Europe", "Italy", "Tuscany", "Florence", "Firenze", "travel", "tourism"
        ])
        XCTAssertEqual(metadata.metadataIPTC?.specialInstructions, "PLUS Registry 01-AA-010 For consideration only. No usage or third party sales granted without prior permission.")
        XCTAssertEqual(metadata.metadataIPTC?.dateCreated, "20070609")
        XCTAssertEqual(metadata.metadataIPTC?.timeCreated, "075613")
        XCTAssertEqual(metadata.metadataIPTC?.digitalCreationDate, "20070609")
        XCTAssertEqual(metadata.metadataIPTC?.digitalCreationTime, "075613")
        XCTAssertEqual(metadata.metadataIPTC?.byline, ["David Riecks"])
        XCTAssertEqual(metadata.metadataIPTC?.city, "Florence")
        XCTAssertEqual(metadata.metadataIPTC?.subLocation, "Near Ponte Vecchio")
        XCTAssertEqual(metadata.metadataIPTC?.provinceState, "Tuscany")
        XCTAssertEqual(metadata.metadataIPTC?.countryPrimaryLocationCode, "IT")
        XCTAssertEqual(metadata.metadataIPTC?.countryPrimaryLocationName, "Italy")
        XCTAssertEqual(metadata.metadataIPTC?.headline, "Florence Locks of Love")
        XCTAssertEqual(metadata.metadataIPTC?.credit, "©2007 David Riecks: www.riecks.com")
        XCTAssertEqual(metadata.metadataIPTC?.source, "David Riecks Photography")
        XCTAssertEqual(metadata.metadataIPTC?.copyrightNotice, "©2007 David Riecks, all rights reserved")
        XCTAssertEqual(metadata.metadataIPTC?.captionAbstract, "Close-up of padlocks on a handrail near the Ponte Vecchio in Firenze (Florence), Italy. This practice has become popular among young lovers, as the legend has it that if you and your loved one attach a padlock to any part of the famous bridge and then throw the key into the Arno River below, your will be eternally bonded. This is one example of the negative impact of mass tourism; as thousands of padlocks need to be removed on a regular basis, since they spoil the view and may damage the structure of the centuries-old bridge. This practice seems to have decreased after the city placed a sign on the bridge noting a 50€ penalty for those caught locking something to the structure.")
        XCTAssertEqual(metadata.metadataIPTC?.writerEditor, ["David Riecks"])
        XCTAssertEqual(metadata.metadataIPTC?.starRating, 3)
        XCTAssertEqual(metadata.metadataIPTC?.rightsUsageTerms, "PLUS Registry 01-AA-010 For consideration only. No usage or third party sales granted without prior permission.")

        XCTAssertNotNil(metadata.metadataIPTC?.creatorContactInfo)
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.city, "Champaign")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.country, "United States of America")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.address, "701 W Washington St.")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.postalCode, "61820")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.stateProvince, "Illinois")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.emails, "david@riecks.com")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.phones, "+1.877.646.5375, +1.217.689.1376")
        XCTAssertEqual(metadata.metadataIPTC?.creatorContactInfo?.webURLs, "http://www.riecks.com/contact.html")

        // stats
        keepStats([metadata])
    }

    func testIPTC2() throws {
        let metadata = try! TestFile.iptc2.readMetadata()
        XCTAssertNotNil(metadata.metadataIPTC)
        XCTAssertEqual(metadata.metadataIPTC?.byline, ["Photoshop Author"])
        XCTAssertEqual(metadata.metadataIPTC?.bylineTitle, ["Photoshop Author Title"])
        XCTAssertEqual(metadata.metadataIPTC?.captionAbstract, "Photoshop Description")
        XCTAssertEqual(metadata.metadataIPTC?.copyrightNotice, "Photoshop Copyrright Notice")
        XCTAssertEqual(metadata.metadataIPTC?.digitalCreationDate, "20110525")
        XCTAssertEqual(metadata.metadataIPTC?.digitalCreationTime, "092207+1200")
        XCTAssertEqual(metadata.metadataIPTC?.keywords, ["beach", "baywatch", "LA", "sunset"])
        XCTAssertEqual(metadata.metadataIPTC?.objectName, "Photoshop Document Ttitle")
        XCTAssertEqual(metadata.metadataIPTC?.dateCreated, "20110525")
        XCTAssertEqual(metadata.metadataIPTC?.timeCreated, "092207")

        // stats
        keepStats([metadata])
    }

    func testIPTC3() throws {
        let metadata = try! TestFile.iptc3.readMetadata()
        XCTAssertNotNil(metadata.metadataIPTC)
        XCTAssertEqual(metadata.metadataIPTC?.credit, "Apple Image Playground")
        XCTAssertEqual(metadata.metadataIPTC?.digitalSourceType, "http://cv.iptc.org/newscodes/digitalsourcetype/trainedAlgorithmicMedia")

        // stats
        keepStats([metadata])
    }

    func testNikon() throws {
        let metadata = try! TestFile.nikon.readMetadata()
        XCTAssertNotNil(metadata.metadataMakerNikon)
        XCTAssertEqual(metadata.metadataMakerNikon?.focusMode, "AF-S  ")
        XCTAssertEqual(metadata.metadataMakerNikon?.whiteBalanceMode, "AUTO        ")
        XCTAssertEqual(metadata.metadataMakerNikon?.isoSetting, [0, 1600])
        XCTAssertEqual(metadata.metadataMakerNikon?.lensType, [.D, .G, .VR])
        XCTAssertEqual(metadata.metadataMakerNikon?.quality, "RAW    ")
        XCTAssertEqual(metadata.metadataMakerNikon?.shootingMode, .continuous)
        XCTAssertEqual(metadata.metadataMakerNikon?.shutterCount, 8834)

        // stats
        keepStats([metadata])
    }

    func testPictureStyle() throws {
        let metadata = try! TestFile.pictureStyle.readMetadata()
        XCTAssertNotNil(metadata.pictureStyle)
        let expected: [String: Any] = [
            "ColorTone" : ["0", 0, 0],
            "FilterEffect" : ["None", 0, 0],
            "Monochrome" : ["0", 0, 0],
            "PhotoEffect" : ["Off", 0, 0],
            "PictStyleColorSpace" : ["sRGB", 1, 1],
            "PictureStyle" : ["4095", 4095, 4095],
            "SharpnessFreq" : ["0", 0, 0],
            "ToningEffect" : ["None", 0, 0]
        ]
        let diff = expected.metadataDifferences(from: metadata.pictureStyle ?? [:], includeValuesInDiff: false)
        XCTAssertTrue(diff.isEmpty)

        // stats
        keepStats([metadata])
    }

    func testPNG() throws {
        let metadata = try! TestFile.png.readMetadata()
        XCTAssertNotNil(metadata.metadataPNG)
        XCTAssertEqual(metadata.metadataPNG?.chromaticities, [
            0.31269000000000002, 0.32899, 0.63999000000000006,
            0.33000000000000002, 0.21000000000000002, 0.71000000000000008,
            0.14999000000000001, 0.059990000000000002
        ])
        XCTAssertEqual(metadata.metadataPNG?.interlaceType, .nonInterlaced)
        XCTAssertEqual(metadata.metadataPNG?.software, "Adobe Photoshop CC 2017 (Macintosh)")
        XCTAssertEqual(metadata.metadataPNG?.xPixelsPerMeter, 11811)
        XCTAssertEqual(metadata.metadataPNG?.yPixelsPerMeter, 11811)

        // stats
        keepStats([metadata])
    }

    func testUnreadable() throws {
        XCTAssertThrowsError(try TestFile.unreadable.readMetadata()) { error in
            XCTAssertEqual(error as? SYMetadata.Error, SYMetadata.Error.cannotCopyPropertiesAtIndexZero)
        }
    }
    
    // MARK: Writing metadata
    func testWritingIPTC() throws {
        let imageURL = TestFile.iptc2.url
        
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
        
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithMetadata)
        XCTAssertEqual(reloadedMetadata.metadataIPTC?.keywords, ["Some test keywords", "added by SYMetadata example app"])
        XCTAssertEqual(reloadedMetadata.metadataIPTC?.city, "Lyon")
        XCTAssertEqual(reloadedMetadata.metadataIPTC?.credit, "© Me 2017")

        // stats
        keepStats([metadata, reloadedMetadata])
    }
    
    func testRemovingChildren() throws {
        let imageURL = TestFile.iptc2.url
        
        // load metadata from original file (please handle errors, the type is SYMetadata.Error)
        let metadata = try! SYMetadata(fileURL: imageURL)

        // make sure we have expected keys
        XCTAssertNotNil(metadata.metadataExif)
        let expectedOriginalKeys: [String] = [
            "ApertureValue", "ColorSpace", "ComponentsConfiguration", "CompressedBitsPerPixel", "Contrast", "CustomRendered", "DateTimeDigitized",
            "DateTimeOriginal", "DigitalZoomRatio", "ExifVersion", "ExposureBiasValue", "ExposureMode", "ExposureProgram", "ExposureTime",
            "FileSource", "Flash", "FlashPixVersion", "FNumber", "FocalLength", "FocalLenIn35mmFilm", "GainControl", "ISOSpeedRatings",
            "LightSource", "MaxApertureValue", "MeteringMode", "PixelXDimension", "PixelYDimension", "Saturation", "SceneCaptureType",
            "SceneType", "SensingMethod", "Sharpness", "ShutterSpeedValue", "WhiteBalance"
        ]
        let existingKeys: [String] = Array((metadata.metadataExif?.originalDictionary ?? [:]).keys)
        XCTAssertEqual(existingKeys.sorted(), expectedOriginalKeys.sorted())

        // remove EXIF
        metadata.metadataExif = nil
        
        // create new image data with original image data and edited metadata
        let originalImageData = try! Data(contentsOf: imageURL)
        let imageDataWithMetadata = try! metadata.apply(to: originalImageData)
        
        // Make sure we remove (almost) all keys
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithMetadata)
        let expectedUpdatedKeys: [String] = ["DateTimeOriginal", "ColorSpace", "PixelYDimension", "DateTimeDigitized", "PixelXDimension"]
        let updatedKeys: [String] = Array((reloadedMetadata.metadataExif?.originalDictionary ?? [:]).keys)
        XCTAssertEqual(updatedKeys.sorted(), expectedUpdatedKeys.sorted())

        // stats
        keepStats([metadata, reloadedMetadata])
    }
    
    func testUpdatingAndRemovingValues() throws {
        let imageURL = TestFile.iptc2.url
        
        // load metadata from original file (please handle errors, the type is SYMetadata.Error)
        let metadata = try! SYMetadata(fileURL: imageURL)

        // make sure we have existin data
        XCTAssertNotNil(metadata.metadataTIFF)
        XCTAssertEqual(metadata.metadataTIFF?.artist, "Photoshop Author")
        XCTAssertEqual(metadata.metadataTIFF?.imageDescription, "Photoshop Description")

        // update author
        // fun fact: I spent days wondering why changing IPTC.artist wasn't working, turns out ImageIO seems to sync it with IPTC.byLine and vice versa if only one is present..
        metadata.metadataTIFF?.artist = "New Artist"
        metadata.metadataIPTC?.byline = ["New Artist"]

        // remove copyright
        metadata.metadataTIFF?.copyright = nil
        metadata.metadataIPTC?.copyrightNotice = nil

        // remove image description
        metadata.metadataTIFF?.imageDescription = nil
        metadata.metadataIPTC?.captionAbstract = nil
        
        // remove photometric interpolation
        metadata.metadataTIFF?.photometricInterpretation = nil
        
        // create new image data with original image data and edited metadata
        let originalImageData = try! Data(contentsOf: imageURL)
        let imageDataWithMetadata = try! metadata.apply(to: originalImageData)
        
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithMetadata)
        XCTAssertEqual(reloadedMetadata.metadataTIFF?.artist, "New Artist")
        XCTAssertEqual(reloadedMetadata.metadataTIFF?.copyright, nil)
        XCTAssertEqual(reloadedMetadata.metadataTIFF?.imageDescription, nil)
        XCTAssertEqual(reloadedMetadata.metadataTIFF?.photometricInterpretation, nil)

        // stats
        keepStats([metadata, reloadedMetadata])
    }
    
    func testStripAll() throws {
        let imageURL = TestFile.iptc2.url
        
        // create new image data with original image data and strip all metadata
        let originalImageData = try! Data(contentsOf: imageURL)
        let imageDataWithoutMetadata = try! SYMetadata.stripAllMetadata(from: originalImageData)
        
        // load metadata for newly cerated image
        let reloadedMetadata = try! SYMetadata(imageData: imageDataWithoutMetadata)
        let keptKeys = reloadedMetadata.originalDictionary.allKeyPaths
        let expectedKeptKeys = [
            "ColorModel",
            "Depth",
            "Orientation",
            "PixelHeight",
            "PixelWidth",
            "ProfileName",
            "{Exif}",
            "{Exif}.ColorSpace",
            "{Exif}.PixelXDimension",
            "{Exif}.PixelYDimension",
            "{JFIF}",
            "{JFIF}.DensityUnit",
            "{JFIF}.JFIFVersion",
            "{JFIF}.XDensity",
            "{JFIF}.YDensity",
            "{TIFF}",
            "{TIFF}.Orientation"
        ]
        XCTAssertEqual(keptKeys.sorted(), expectedKeptKeys.sorted())

        // stats
        keepStats([reloadedMetadata])
    }
}
