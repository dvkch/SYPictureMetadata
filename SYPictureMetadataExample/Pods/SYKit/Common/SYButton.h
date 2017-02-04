//
//  SYButton.h
//  SYKit
//
//  Created by Stan Chevallier on 24/09/2015.
//  Copyright © 2015 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SYButton : UIControl

@property (nonatomic, strong) IBInspectable NSString *text;
@property (nonatomic, assign) IBInspectable CGFloat contentInset;
@property (nonatomic, assign) IBInspectable CGFloat fontSize;
@property (nonatomic, assign) IBInspectable CGSize textOffset;
@property (nonatomic, strong) IBInspectable UIColor *backColor;
@property (nonatomic, strong) IBInspectable UIColor *selectedBackColor;

@end
