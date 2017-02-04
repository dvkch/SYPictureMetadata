//
//  SYSearchField.h
//  SYKit
//
//  Created by Stanislas Chevallier on 03/06/15.
//  Copyright (c) 2015 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYSearchField;

@protocol SYSearchFieldDelegate <NSObject>
- (void)searchFieldDidReturn:(SYSearchField *)searchField withText:(NSString *)text;
@end

IB_DESIGNABLE
@interface SYSearchField : UIView <UITextFieldDelegate>

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSURL *titleURL;
@property (nonatomic, weak) IBOutlet id<SYSearchFieldDelegate> delegate;
@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic, strong, readonly) UIImageView *imageViewIcon;
@property (nonatomic, strong, readonly) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) IBInspectable UIColor *loupeColor;

- (void)showLoadingIndicator:(BOOL)showLoadingIndicator;

@end
