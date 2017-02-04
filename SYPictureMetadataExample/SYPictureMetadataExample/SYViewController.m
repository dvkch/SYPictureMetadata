//
//  SYViewController.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYViewController.h"
#import "SYMetadata.h"
#import <UIImage+SYKit.h>
#import "NSDictionary+SY.h"

@interface SYViewController ()
- (void)showJpeg;
- (void)showRaw;
@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Determine files that have the most data for tests
    // [self analyzeSetOfFiles];
    
    // Read test images and test if the parsed metadata is equal to the original dictionary
    // [self testMetadataNotLostWhenRead];
    
    // Create a test image with some metadata, save it, reload it to check if metadata is here
    [self testMetadataWrite];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showJpeg];
}

- (IBAction)jpegButtonClick:(id)sender
{
    [self showJpeg];
}

- (IBAction)rawButtonClick:(id)sender
{
    [self showRaw];
}

- (void)showJpeg
{
    NSURL *picUrl = [[NSBundle mainBundle] URLForResource:@"Test images/drp2029156x" withExtension:@"jpg"];
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:picUrl];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[picUrl path]]];
    [self.textView setText:[[metadata originalDictionary] description]];
    [self.textView scrollRectToVisible:CGRectMake(0.f, 0.f, 1.f, 1.f) animated:NO];
}

- (void)showRaw
{
    NSURL *picUrl = [[NSBundle mainBundle] URLForResource:@"Test images/IMG_NIKON" withExtension:@"NEF"];
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:picUrl];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[picUrl path]]];
    [self.textView setText:[[metadata originalDictionary] description]];
    [self.textView scrollRectToVisible:CGRectMake(0.f, 0.f, 1.f, 1.f) animated:NO];
}

#pragma mark - Tests

- (void)testMetadataNotLostWhenRead
{
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"Test images" ofType:nil];
    NSArray <NSString *> *imagesPaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:NULL];
    
    for (NSString *imageName in imagesPaths)
    {
        NSURL *picUrl = [NSURL fileURLWithPath:[rootPath stringByAppendingPathComponent:imageName]];
        [SYMetadata testWithFileURL:picUrl];
    }
}

- (void)analyzeSetOfFiles
{
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"Test images" ofType:nil];
    NSArray <NSString *> *imagesPaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:NULL];
    
    // first we load all metadatas
    NSMutableDictionary <NSString *, SYMetadata *> *metadatas = [NSMutableDictionary dictionary];
    for (NSString *imageName in imagesPaths)
    {
        NSURL *picUrl = [NSURL fileURLWithPath:[rootPath stringByAppendingPathComponent:imageName]];
        SYMetadata *metadata = [SYMetadata metadataWithFileURL:picUrl];
        
        if (!metadata)
            NSLog(@"Couldn't read metadata for file: %@", imageName);
        else
            metadatas[imageName] = metadata;
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
                NSLog(@"The following images have the same list of keys:\n%@", sameList);
        }
    }
    
    NSMutableSet *allKeys = [NSMutableSet set];
    
    // now we compare each metadata to each other ones to determine if a file is
    // pertinent (i.e. it has some metadata that no other have)
    for (NSString *imageName1 in metadatas.allKeys)
    {
        NSMutableArray <NSString *> *uniqueKeys = [[metadatas[imageName1].originalDictionary sy_allKeypaths] mutableCopy];
        [allKeys addObjectsFromArray:uniqueKeys];
        
        for (NSString *imageName2 in metadatas.allKeys)
        {
            if ([imageName1 isEqualToString:imageName2])
                continue;
            
            NSArray <NSString *> *keys2 = [metadatas[imageName2].originalDictionary sy_allKeypaths];
            [uniqueKeys removeObjectsInArray:keys2];
        }
        
        if (uniqueKeys.count == 0)
        {
            NSLog(@"File %@ is not pertinent", imageName1);
        }
        else
        {
            NSLog(@"File %@ has %d unique keys", imageName1, (int)uniqueKeys.count);
        }
    }
    
#warning add total
    NSLog(@"Current set of files uses %d keys", (int)allKeys.count);
}

- (void)testMetadataWrite
{
    UIImage *image = [UIImage sy_imageWithColor:[UIColor whiteColor]];
}

@end
