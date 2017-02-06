SYPictureMetadata
=================

Read and write images metadata using `ImageIO` and easy to use models.

Example:

```
    // load metadata from original file
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:imageURL];
    
    // create IPTC container if not present
    if (!metadata.metadataIPTC)
        metadata.metadataIPTC = [[SYMetadataIPTC alloc] init];
    
    // edit metadata
    metadata.metadataIPTC.keywords  = @[@"Some test keywords", @"added by SYMetadata example app"];
    metadata.metadataIPTC.city      = @"Lyon";
    metadata.metadataIPTC.credit    = @"© Me 2017";
    
    // create new image data with original image data and edited metadata
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    NSData *dataWithMetadata = [SYMetadata dataWithImageData:data andMetadata:metadata];
    
    // load metadata for newly cerated image
    SYMetadata *metadataNew = [SYMetadata metadataWithImageData:dataWithMetadata];
    
    // log the delta in file size
    NSLog(@"Delta: %ld bytes", (unsigned long)dataWithMetadata.length - (unsigned long)data.length);
    
    // log the differences between files
    NSLog(@"Differences:\n%@", [NSDictionary sy_differencesFrom:metadata.originalDictionary
                                                             to:metadataNew.originalDictionary
                                            includeValuesInDiff:YES]);
```

Keep in mind
============

When saving metadata to a file you can encouter the following issues:

- metadata was not written
- metadata was modified a bit
- metadata was added

This library uses `ImageIO` which has its own limitations and performs its own value checks. This is just a wrapper around the `NSDictionary` structure this framework exposes and is not perfect. Please heavily test your app if you use this library to edit metadata, a set of test images for tests can be found in the example app (currently testing around 216 keys out of 314 supported on iOS 10.2). This library DOES NOT garantee data integrity like `libexif` or `exiv2` would.

Screenshots
===========

![Metadata copy](https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_copy.PNG)

![Metadata editing](https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_editing.PNG)

![Data set analysis](https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_set_analysis.PNG)

![Metadata preview](https://raw.githubusercontent.com/dvkch/SYPictureMetadata/master/screenshots/screenshot_preview.PNG)

Credits
=======

You'll find links that helped me a lot in comments inside this library where appropriate. Mainly:

- <http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/index.html>
- <http://www.exiv2.org/tags.html>
- <https://github.com/Nikita2k/SimpleExif>
- <https://raw.githubusercontent.com/wiki/drewnoakes/metadata-extractor/docs/CIFFspecV1R04.pdf>
- <https://www.adobe.com/content/dam/Adobe/en/products/photoshop/pdfs/dng_spec_1.4.0.0.pdf>

Credits to chrfb (<http://chrfb.deviantart.com>) for the beautiful icons I used in the tab buttons.