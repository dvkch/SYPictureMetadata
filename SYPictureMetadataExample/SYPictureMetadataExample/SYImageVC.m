//
//  SYImageVC.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYImageVC.h"
#import "SYMetadata.h"

@interface SYImageVC ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation SYImageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setPictureURL:self.pictureURL];
}

- (void)setPictureURL:(NSURL *)pictureURL
{
    self->_pictureURL = pictureURL;
    SYMetadata *metadata = [SYMetadata metadataWithFileURL:pictureURL];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[pictureURL path]]];
    [self.textView setText:[[metadata originalDictionary] description]];
    [self.textView scrollRectToVisible:CGRectMake(0.f, 0.f, 1.f, 1.f) animated:NO];
}

@end
