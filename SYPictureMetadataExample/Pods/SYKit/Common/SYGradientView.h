//
//  SYGradientView.h
//  SYKit
//
//  Created by Stan Chevallier on 09/02/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYGradientView : UIView

@property (nonatomic, readonly, strong) CAGradientLayer *layer;
@property (nonatomic, copy) void(^layoutSubviewsBlock)(SYGradientView *view);

@end
