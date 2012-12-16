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
-(void)showJpeg;
-(void)showRaw;
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

-(void)showJpeg
{
    NSURL *picUrl = [[NSBundle mainBundle] URLForResource:@"IMG_NIKON" withExtension:@"JPG"];
    SYMetadata *metadata = [[SYMetadata alloc] initWithAbsolutePathURL:picUrl];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[picUrl path]]];
    [self.textView setText:[[metadata allMetadatas] description]];
    [self.textView scrollRectToVisible:CGRectMake(0.f, 0.f, 1.f, 1.f) animated:NO];
}

-(void)showRaw
{
    NSURL *picUrl = [[NSBundle mainBundle] URLForResource:@"IMG_NIKON" withExtension:@"NEF"];
    SYMetadata *metadata = [[SYMetadata alloc] initWithAbsolutePathURL:picUrl];
    
    [self.imageView setImage:[UIImage imageWithContentsOfFile:[picUrl path]]];
    [self.textView setText:[[metadata allMetadatas] description]];
    [self.textView scrollRectToVisible:CGRectMake(0.f, 0.f, 1.f, 1.f) animated:NO];
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
