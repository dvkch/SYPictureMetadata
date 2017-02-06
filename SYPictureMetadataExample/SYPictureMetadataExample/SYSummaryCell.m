//
//  SYSummaryCell.m
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 05/02/2017.
//  Copyright © 2017 Syan. All rights reserved.
//

#import "SYSummaryCell.h"

@interface SYSummaryCell ()
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelDetails;
@end

@implementation SYSummaryCell

- (void)setTitle:(NSString *)title
{
    self->_title = title;
    [self.labelTitle setText:title];
}

- (void)setDetails:(NSString *)details
{
    self->_details = details;
    [self.labelDetails setText:details];
}

@end
