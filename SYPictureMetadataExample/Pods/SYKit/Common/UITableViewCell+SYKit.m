//
//  UITableViewCell+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 12/04/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "UITableViewCell+SYKit.h"

@implementation UITableViewCell (SYKit)

+ (CGFloat)sy_cellHeightForWidth:(CGFloat)width
              configurationBlock:(void(^)(UITableViewCell *sizingCell))configurationBlock
{
    static UITableViewCell *sizingCell = nil;
    if (!sizingCell)
    {
        sizingCell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sizingCell"];
        [sizingCell setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    if (configurationBlock)
        configurationBlock(sizingCell);
    
    [sizingCell setFrame:CGRectMake(0, 0, width, 8000.)];
    [sizingCell setNeedsUpdateConstraints];
    [sizingCell updateConstraintsIfNeeded];
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:sizingCell.contentView
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.
                                                                        constant:width];
    [sizingCell.contentView addConstraint:widthConstraint];
    [sizingCell.contentView layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:CGSizeMake(width, 8000)];
    [sizingCell.contentView removeConstraint:widthConstraint];
    
    return ceil(size.height);
}

@end
