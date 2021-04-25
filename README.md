# SYPictureMetadata

Read and write images metadata using `ImageIO` and easy to use models.

## Screenshots

<img src="https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_set_analysis.png" alt="Data set analysis" width="300"/>
<img src="https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_preview.png" alt="Metadata preview" width="300"/>

## Metadata support

#### ImageIO Keys

A lot of keys have been added to ImageIO since iOS 11, they are mostly about DNG, HEIC and IPTC Ext data and are not currently supported. The full list is available in [Keys/Unsupported.txt](Keys/Unsupported.txt). Feel free to send a PR my way, ideally with a test case :)

Currently we support 325 keys out of 628 defined keys in iOS 14.4, or about 51%.

#### Test coverage

There are basic tests in place currently testing around 32% of defined getters and 3% of defined setters. If you need to support specific attributes in your application you should test those too, and you're welcome to send a PR to increase coverage in this library.

Xcode reports 36.4% of test coverage for this library.

#### Photos captions (iOS 14)

I have added preliminary support for iOS 14 photo captions. Since this data is not stored in the image data like any other metadata read but `ImageIO` until the image is exported, I made a quick `PHAsset` extension with a read-only  property called `assetCaption` to obtain this information.

More details in [SYMetadataExtensions.swift](https://github.com/dvkch/SYPictureMetadata/blob/master/SYPictureMetadata/SYMetadataExtensions.swift)

## Keep in mind

When saving metadata to a file you can encouter the following issues:

- metadata was not written
- metadata was modified a bit
- metadata was added
- metadata should have been removed but was kept because ImageIO found a similar metadata in another namespace (e.g. removing TIFF.artist doesn't work if IPTC.byLine is present)

This library uses `ImageIO` which has its own limitations and performs its own value checks. This is just a wrapper around the `NSDictionary` structure this framework exposes and is not perfect. Please heavily test your app if you use this library to edit metadata, a set of test images for tests can be found in the example app. This library DOES NOT garantee data integrity like `libexif` or `exiv2` would.

## Examples

#### Adding IPTC data example:

```
// this is available in the Example project
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
```

#### Stripping all metadata

```
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
```

## Credits

You'll find links that helped me a lot in comments inside this library where appropriate. Mainly:

- <http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/index.html>
- <http://www.exiv2.org/tags.html>
- <https://github.com/Nikita2k/SimpleExif>
- <https://raw.githubusercontent.com/wiki/drewnoakes/metadata-extractor/docs/CIFFspecV1R04.pdf>
- <https://www.adobe.com/content/dam/Adobe/en/products/photoshop/pdfs/dng_spec_1.4.0.0.pdf>
- <https://www.awaresystems.be/imaging/tiff/tifftags/privateifd/gps.html>
- <https://docs.oracle.com/javase/9/docs/api/javax/imageio/metadata/doc-files/tiff_metadata.html#ImageMetadata>
- <https://openimageio.readthedocs.io/en/release-2.1.11.0/stdmetadata.html>

## License

Use it as you like in every project you want, redistribute with mentions of my name and don't blame me if it breaks :)

-- syan
 
