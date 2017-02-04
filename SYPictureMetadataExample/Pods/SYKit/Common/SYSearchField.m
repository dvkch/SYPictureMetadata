//
//  SYSearchField.m
//  SYKit
//
//  Created by Stanislas Chevallier on 03/06/15.
//  Copyright (c) 2015 Syan. All rights reserved.
//

#import "SYSearchField.h"
#import "UIImage+SYKit.h"

@interface SYSearchField ()
@property (nonatomic, strong, readwrite) UITextField *textField;
@property (nonatomic, strong, readwrite) UIImageView *imageViewIcon;
@property (nonatomic, strong, readwrite) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) NSString *lastText;
@property (nonatomic, assign) BOOL isTyping;
@end

@implementation SYSearchField

- (instancetype)init
{
    self = [super init];
    if (self) [self customInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) [self customInit];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) [self customInit];
    return self;
}

- (void)customInit
{
    if (self.textField)
        return;
    
    self.imageViewIcon = [[UIImageView alloc] init];
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activityIndicatorView setColor:[UIColor darkGrayColor]];
    [self.activityIndicatorView setHidesWhenStopped:YES];
    CGRect f = self.activityIndicatorView.frame; f.size.width += 10;
    [self.activityIndicatorView setFrame:f];
    
    self.textField = [[UITextField alloc] init];
    [self.textField setTextAlignment:NSTextAlignmentLeft];
    [self.textField setDelegate:self];
    [self.textField setBorderStyle:UITextBorderStyleNone];
    [self.textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self.textField setReturnKeyType:UIReturnKeyGo];
    [self.textField setKeyboardType:UIKeyboardTypeURL];
    [self.textField setPlaceholder:@"Search or open a website"];
    [self.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.textField setLeftView:self.imageViewIcon];
    [self.textField setLeftViewMode:UITextFieldViewModeUnlessEditing];
    [self addSubview:self.textField];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureTapped:)];
    [self addGestureRecognizer:self.tapGesture];
    
    // if we're init-ing from a coder we don't reset settings
    
    if (!self.loupeColor)
        [self setLoupeColor:[UIColor darkGrayColor]];
    
    if (!self.backgroundColor)
        [self setBackgroundColor:[UIColor colorWithWhite:222./255. alpha:1.]];

    [self.layer setCornerRadius:4.];

    [self setIsTyping:NO];
}

- (void)showLoadingIndicator:(BOOL)showLoadingIndicator
{
    if(showLoadingIndicator)
        [self.activityIndicatorView startAnimating];
    else
        [self.activityIndicatorView stopAnimating];
    [self setNeedsLayout];
}

- (void)setIsTyping:(BOOL)isTyping animated:(BOOL)animated
{
    if(!animated)
    {
        [self setIsTyping:isTyping];
        return;
    }
    
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        [self setIsTyping:isTyping];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if(isTyping)
            [self.textField selectAll:nil];
    }];
}

- (void)setIsTyping:(BOOL)isTyping
{
    self->_isTyping = isTyping;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageViewIcon setFrame:(CGRect){CGPointZero, self.imageViewIcon.image.size}];
    
    if(self.isTyping)
    {
        NSString *title = self.titleURL ? self.titleURL.absoluteString : self.titleText;
        [self.textField setLeftView:nil];
        [self.textField setText:title];
        [self.textField setFrame:CGRectInset(self.bounds, 10, 0)];
    }
    else
    {
        NSString *title = self.titleURL ? self.titleURL.host : self.titleText;
        [self.textField setText:title];
        
        // if the spinner is running: show it
        // if we display the url: show nothing
        // if we display a specific text (most probably the search query): show the loupe
        // if there is no text provided (meaning empty search field): show the loupe
        
        if (self.activityIndicatorView.isAnimating)
            [self.textField setLeftView:self.activityIndicatorView];
        else if (self.textField.text.length == 0 || title == self.titleText)
            [self.textField setLeftView:self.imageViewIcon];
        else
            [self.textField setLeftView:nil];
        
        NSString *str = self.textField.text.length ? self.textField.text : self.textField.placeholder;
        CGFloat w = [str sizeWithAttributes:@{NSFontAttributeName:self.textField.font}].width;
        
        if (self.textField.leftView)
            w += self.activityIndicatorView.bounds.size.width + 10;
        w += [self.textField clearButtonRectForBounds:self.bounds].size.width;
        
        CGFloat maxWidth = CGRectGetWidth(self.bounds);
        w = MIN(maxWidth, w);
        [self.textField setFrame:CGRectMake(CGRectGetWidth(self.bounds) /2. - w/2., 0, w, CGRectGetHeight(self.bounds))];
    }
}

#pragma mark - Properties

- (void)setTitleText:(NSString *)titleText
{
    self->_titleText = titleText;
    self->_titleURL = nil;
    [self setIsTyping:NO animated:NO];
}

- (void)setTitleURL:(NSURL *)titleURL
{
    self->_titleURL = titleURL;
    self->_titleText = nil;
    [self setIsTyping:NO animated:NO];
}

- (void)setPlaceholderText:(NSString *)placeholderText
{
    [self.textField setPlaceholder:placeholderText];
}

- (NSString *)placeholderText
{
    return self.textField.placeholder;
}

- (void)setLoupeColor:(UIColor *)loupeColor
{
    self->_loupeColor = loupeColor;
    [self updateLoupeImage];
}

- (void)updateLoupeImage
{
    NSBundle *mainBundle = [NSBundle mainBundle];
#ifdef TARGET_IPHONE_SIMULATOR
    mainBundle = [NSBundle bundleForClass:[self class]];
#endif
    
    NSString *bundlePath = [mainBundle pathForResource:@"SYSearchField" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    // in case we're not using cocoapods
    if (!bundle)
        bundle = mainBundle;
    
    NSString *loupePath = [bundle pathForResource:@"loupe" ofType:@"png"];
    UIImage *loupeImg = [[UIImage imageWithContentsOfFile:loupePath] sy_imageResizedSquarreTo:15];
    
    loupeImg = [loupeImg sy_imageByAddingPaddingTop:0 left:8 right:7 bottom:2];
    loupeImg = [loupeImg sy_imageMaskedWithColor:self.loupeColor];
    CGFloat a;
    [self.loupeColor getRed:NULL green:NULL blue:NULL alpha:&a];
    
    [self.imageViewIcon setImage:loupeImg];
    [self.imageViewIcon setAlpha:a];
    [self setNeedsLayout];
}

#pragma mark - UITextField

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self setIsTyping:YES animated:YES];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.lastText = textField.text;
    if(self.delegate)
        [self.delegate searchFieldDidReturn:self withText:textField.text];
    [self.textField resignFirstResponder];
    return NO;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self setIsTyping:NO animated:YES];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [textField setText:nil];
    self.lastText = nil;
    if(self.delegate)
        [self.delegate searchFieldDidReturn:self withText:textField.text];
    [self.textField resignFirstResponder];
    return NO;
}

#pragma mark - UIGestureRecognizer

- (void)tapGestureTapped:(UITapGestureRecognizer *)sender
{
    [self.textField becomeFirstResponder];
}

#pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)becomeFirstResponder
{
    return [self.textField becomeFirstResponder];
}

@end
