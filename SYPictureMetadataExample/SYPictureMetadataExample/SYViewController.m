//
//  SYViewController.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYViewController.h"
#import "SYMetadata.h"

@interface SYViewController ()

@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSURL *picUrl = [[NSBundle mainBundle] URLForResource:@"IMG_NIKON" withExtension:@"JPG"];
    SYMetadata *metadata = [[SYMetadata alloc] initWithAbsolutePathURL:picUrl];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[picUrl path]]];
    [self.textView setText:[[metadata allMetadatas] description]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setTextView:nil];
    [super viewDidUnload];
}
@end
