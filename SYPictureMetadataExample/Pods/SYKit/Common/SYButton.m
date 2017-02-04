//
//  SYButton.m
//  SYKit
//
//  Created by Stan Chevallier on 24/09/2015.
//  Copyright © 2015 Syan. All rights reserved.
//

#import "SYButton.h"

@interface SYButton ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *backView;
@end

@implementation SYButton

@synthesize selectedBackColor = _selectedBackColor;

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

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    [self customInit];
}

- (void)customInit
{
    if (self.backView)
        return;
    
    self.backView = [[UIView alloc] init];
    [self.backView setUserInteractionEnabled:NO];
    [self addSubview:self.backView];
    
    self.label = [[UILabel alloc] init];
    [self.backView addSubview:self.label];

    [self.layer setShadowColor:[UIColor darkGrayColor].CGColor];
    [self.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.layer setShadowOpacity:.5];
    [self.layer setShadowRadius:3];
    
    [self setTintColor:self.tintColor];
    [self setBackgroundColor:self.backgroundColor];
    [self setText:self.text];
    [self setFontSize:self.fontSize];
}

- (void)updateBackgroundImage
{
    [self.backView setBackgroundColor:(self.selected ? self.selectedBackColor : self.backColor)];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect = CGRectInset(self.bounds, self.contentInset, self.contentInset);
    
    [self.backView.layer setCornerRadius:MIN(rect.size.width, rect.size.height)/2.];
    [self.backView setFrame:rect];
    
    [self.label sizeToFit];
    [self.label setCenter:CGPointMake(self.backView.bounds.size.width  / 2. + self.textOffset.width,
                                      self.backView.bounds.size.height / 2. + self.textOffset.height)];
}

- (void)setBackColor:(UIColor *)backColor
{
    self->_backColor = backColor;
    [self updateBackgroundImage];
}

- (void)setSelectedBackColor:(UIColor *)selectedBackColor
{
    self->_selectedBackColor = selectedBackColor;
    [self updateBackgroundImage];
}

- (UIColor *)selectedBackColor
{
    return self->_selectedBackColor ?: self.backColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    [self.label setTextColor:tintColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventTouchDown];
    [self setSelected:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches allObjects][0];
    CGPoint point = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, point))
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    else
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    
    [self setSelected:NO];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self updateBackgroundImage];
}

- (void)setFontSize:(CGFloat)fontSize
{
    [self.label setFont:[UIFont systemFontOfSize:fontSize]];
}

- (CGFloat)fontSize
{
    return self.label.font.pointSize;
}

- (void)setText:(NSString *)text
{
    [self.label setText:text];
}

- (NSString *)text
{
    return self.label.text;
}

- (void)setTextOffset:(CGSize)textOffset
{
    self->_textOffset = textOffset;
    [self setNeedsLayout];
}

@end
