//
//  SYSummaryVC.m
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 05/02/2017.
//  Copyright © 2017 Syan. All rights reserved.
//

#import "SYSummaryVC.h"
#import "SYSummaryCell.h"
#import "SYMetadata.h"
#import <UIImage+SYKit.h>
#import "NSDictionary+SY.h"
#import <AssetsLibrary/AssetsLibrary.h>

typedef enum : NSUInteger {
    SYSummarySection_DataSetAnalysis,
    SYSummarySection_Parsing,
    SYSummarySection_CopyToNewFile,
    SYSummarySection_EditingInPlace,
    SYSummarySection_Max = SYSummarySection_EditingInPlace,
} SYSummarySection;

@interface SYSummaryVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <NSURL *> *URLs;
@property (nonatomic, strong) NSArray <NSURL *> *URLsJpgPng;
@end

@implementation SYSummaryVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(SYSummaryCell.class) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass(SYSummaryCell.class)];
    
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"Test images" ofType:nil];
    NSArray <NSString *> *imageNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:NULL];
    
    NSMutableArray <NSURL *> *URls = [NSMutableArray array];
    for (NSString *imageName in imageNames)
    {
        NSURL *picUrl = [NSURL fileURLWithPath:[rootPath stringByAppendingPathComponent:imageName]];
        [URls addObject:picUrl];
    }
    
    self.URLs = [URls copy];
    
    self.URLsJpgPng = [self.URLs filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSURL *URL, id _) {
        return [@[@"PNG", @"JPEG", @"JPG"] containsObject:URL.pathExtension.uppercaseString];
    }]];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Details

- (NSString *)parsingDetailsForFileAtUrl:(NSURL *)url
{
    // here we compare the data read in an NSDictionary by iOS to
    // an NSDictionary generated from the parsed data in
    // SYMetadata. The `diffs` dctionary will determine keys
    // lost or added by the parsing, and those changed
    
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:url];
    NSDictionary *diffs = [metadata differencesFromOriginalMetadataToModel];
    return (diffs.count ? diffs.description : @"No differences");
}

// Determine files that have the most data for tests
- (NSString *)detailedAnalyzeOfImagesSet
{
    NSMutableArray <NSString *> *details = [NSMutableArray array];
    
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"Test images" ofType:nil];
    NSArray <NSString *> *imagesPaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:NULL];
    
    // first we load all metadatas
    NSMutableDictionary <NSString *, SYMetadata *> *metadatas = [NSMutableDictionary dictionary];
    NSMutableArray <NSString *> *unreadableFilenames = [NSMutableArray array];
    for (NSString *imageName in imagesPaths)
    {
        NSURL *picUrl = [NSURL fileURLWithPath:[rootPath stringByAppendingPathComponent:imageName]];
        SYMetadata *metadata = [SYMetadata metadataWithFileURL:picUrl];
        
        if (metadata)
            metadatas[imageName] = metadata;
        else
            [unreadableFilenames addObject:imageName];
    }
    
    // add to log
    if (unreadableFilenames.count)
    {
        [details addObject:@"Couldn't read metadata for files:"];
        for (NSString *filename in unreadableFilenames)
            [details addObject:[NSString stringWithFormat:@" - %@", filename]];
        [details addObject:@""];
    }
    
    // detect images that have the same list of keys
    {
        NSMutableDictionary <NSArray <NSString *> *, NSMutableArray <NSString *> *> *sameLists = [NSMutableDictionary dictionary];
        for (NSString *imageName in metadatas.allKeys)
        {
            NSArray <NSString *> *keys = [metadatas[imageName].originalDictionary sy_allKeypaths];
            NSMutableArray <NSString *> *sameImageNames = sameLists[keys];
            if (!sameImageNames)
                sameImageNames = [NSMutableArray array];
            [sameImageNames addObject:imageName];
            sameLists[keys] = sameImageNames;
        }
        
        for (id key in sameLists)
        {
            NSMutableArray <NSString *> *sameList = sameLists[key];
            if (sameList.count > 1)
            {
                // add to log
                [details addObject:@"Images using same set of metadata keys:"];
                for (NSString *filename in sameList)
                    [details addObject:[NSString stringWithFormat:@" - %@", filename]];
                [details addObject:@""];
                
                // remove from further analysis
                [metadatas removeObjectsForKeys:sameList];
            }
        }
    }
    
    NSMutableSet *readKeys = [NSMutableSet set];
    NSMutableDictionary <NSString *, NSNumber *> *uniquesKeysByFile = [NSMutableDictionary dictionary];
    
    // now we compare each metadata to each other ones to determine if a file is
    // pertinent (i.e. it has some metadata that no other have)
    for (NSString *imageName1 in metadatas.allKeys)
    {
        NSMutableArray <NSString *> *uniqueKeys = [[metadatas[imageName1].originalDictionary sy_allKeypaths] mutableCopy];
        [readKeys addObjectsFromArray:uniqueKeys];
        
        for (NSString *imageName2 in metadatas.allKeys)
        {
            if ([imageName1 isEqualToString:imageName2])
                continue;
            
            NSArray <NSString *> *keys2 = [metadatas[imageName2].originalDictionary sy_allKeypaths];
            [uniqueKeys removeObjectsInArray:keys2];
        }
        
        uniquesKeysByFile[imageName1] = @(uniqueKeys.count);
    }
    
    // add useless files to log
    NSArray <NSString *> *uselessFiles = [uniquesKeysByFile allKeysForObject:@(0)];
    if (uselessFiles.count)
    {
        [details addObject:@"Images using keys all present in other files of the set (e.g. not relevant):"];
        for (NSString *filename in uselessFiles)
            [details addObject:[NSString stringWithFormat:@" - %@", filename]];
        [details addObject:@""];
    }
    
    [uniquesKeysByFile removeObjectsForKeys:uselessFiles];
    
    // add unique keys count to log
    {
        [details addObject:@"Number of unique keys by file:"];
        for (NSString *filename in uniquesKeysByFile)
            [details addObject:[NSString stringWithFormat:@" - %d for %@", uniquesKeysByFile[filename].intValue, filename]];
        [details addObject:@""];
    }
    
    NSUInteger totalCount = 0;
    for (NSString *filename in uniquesKeysByFile)
        totalCount += uniquesKeysByFile[filename].unsignedIntegerValue;
    
    // add total keys to log
    [details addObject:
     [NSString stringWithFormat:@"Currrent set of files uses %d keys out of %d supported",
      (int)readKeys.count,
      (int)[SYMetadata supportedKeys].count]];
    
    return [details componentsJoinedByString:@"\n"];
}

// Copy metadata of an image in the test set to a newly created image, save it, compare metadata from original file and from newly created file
- (NSString *)detailsForMetadataCopyFromFile:(NSURL *)url
{
    NSMutableArray <NSString *> *details = [NSMutableArray array];
    
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:url];
    
    UIImage *image = [UIImage sy_imageWithColor:[UIColor redColor] size:CGSizeMake(20, 20) cornerRadius:4];
    NSData *data;
    if ([url.pathExtension.uppercaseString isEqualToString:@"PNG"])
        data = UIImagePNGRepresentation(image);
    else
        data = UIImageJPEGRepresentation(image, 1.);
    
    NSData *dataWithMetadata = [SYMetadata dataWithImageData:data andMetadata:metadata];
    SYMetadata *metadataNew = [SYMetadata metadataWithImageData:dataWithMetadata];
    
    [details addObject:[NSString stringWithFormat:@"Differences between original and new image with copied metadata:\n%@",
                        [NSDictionary sy_differencesFrom:metadata.originalDictionary
                                                      to:metadataNew.originalDictionary
                                     includeValuesInDiff:NO]]];
    
    // Save file to documents
    /*
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docsPath stringByAppendingPathComponent:@"generated.png"];
    [dataWithMetadata writeToFile:filePath atomically:YES];
    NSLog(@"Generated file is at %@", filePath);
     */
    
    // Save file to camera roll
    /*
     ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
     [library writeImageDataToSavedPhotosAlbum:dataWithMetadata
     metadata:nil
     completionBlock:^(NSURL *assetURL, NSError *error)
     {
     NSLog(@"Success at %@", [assetURL path]);
     }];
     */
    
    return [details componentsJoinedByString:@"\n"];
}

// Edit specific items of metadata from an image, without editing the image data itself
- (NSString *)detailsForEditingInPlaceForFile:(NSURL *)fileURL
{
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:fileURL];
    
    if (!metadata.metadataIPTC)
        metadata.metadataIPTC = [[SYMetadataIPTC alloc] init];
    
    metadata.metadataIPTC.keywords = [@"Some test keywords|added by SYMetadata example app" componentsSeparatedByString:@"|"];
    metadata.metadataIPTC.city      = @"Lyon";
    metadata.metadataIPTC.credit    = @"Some credit";
    
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    NSData *dataWithMetadata = [SYMetadata dataWithImageData:data andMetadata:metadata];
    
    SYMetadata *metadataNew = [SYMetadata metadataWithImageData:dataWithMetadata];
    
    NSMutableArray <NSString *> *details = [NSMutableArray array];
    [details addObject:[NSString stringWithFormat:@"Delta: %ld bytes",
                        (unsigned long)dataWithMetadata.length - (unsigned long)data.length]];
    
    [details addObject:[NSString stringWithFormat:@"Differences:\n%@",
                        [NSDictionary sy_differencesFrom:metadata.originalDictionary
                                                      to:metadataNew.originalDictionary
                                     includeValuesInDiff:YES]]];
    
    return [details componentsJoinedByString:@"\n"];
}

#pragma mark - TableView

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch ((SYSummarySection)section)
    {
        case SYSummarySection_DataSetAnalysis:
            return @"Data set analysis";
        case SYSummarySection_Parsing:
            return @"Parsing";
        case SYSummarySection_CopyToNewFile:
            return @"Copy metadata to new file";
        case SYSummarySection_EditingInPlace:
            return @"Editing in place";
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SYSummarySection_Max + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch ((SYSummarySection)section)
    {
        case SYSummarySection_DataSetAnalysis:
            return 1;
        case SYSummarySection_Parsing:
            return self.URLs.count;
        case SYSummarySection_CopyToNewFile:
            return self.URLsJpgPng.count;
        case SYSummarySection_EditingInPlace:
            return self.URLsJpgPng.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SYSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(SYSummaryCell.class)];
    
    switch ((SYSummarySection)indexPath.section)
    {
        case SYSummarySection_DataSetAnalysis:
            cell.title      = @"";
            cell.details    = [self detailedAnalyzeOfImagesSet];
            break;
        case SYSummarySection_Parsing:
            cell.title      = self.URLs[indexPath.row].lastPathComponent;
            cell.details    = [self parsingDetailsForFileAtUrl:self.URLs[indexPath.row]];
            break;
        case SYSummarySection_CopyToNewFile:
            cell.title      = self.URLsJpgPng[indexPath.row].lastPathComponent;
            cell.details    = [self detailsForMetadataCopyFromFile:self.URLsJpgPng[indexPath.row]];
            break;
        case SYSummarySection_EditingInPlace:
            cell.title      = self.URLsJpgPng[indexPath.row].lastPathComponent;
            cell.details    = [self detailsForEditingInPlaceForFile:self.URLsJpgPng[indexPath.row]];
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

@end
