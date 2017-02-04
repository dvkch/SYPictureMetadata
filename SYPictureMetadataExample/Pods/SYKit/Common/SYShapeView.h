//
//  SYShapeView.h
//  SYKit
//
//  Created by Stan Chevallier on 09/02/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYShapeView : UIView

@property (nonatomic, readonly, strong) CAShapeLayer *layer;
@property (nonatomic, assign) BOOL useBackgroundColorAsFillColor;
@property (nonatomic, copy) void(^layoutSubviewsBlock)(SYShapeView *view);

@end
