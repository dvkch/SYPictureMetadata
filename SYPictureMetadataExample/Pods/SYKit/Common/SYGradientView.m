//
//  SYGradientView.m
//  SYKit
//
//  Created by Stan Chevallier on 09/02/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "SYGradientView.h"

@implementation SYGradientView

@dynamic layer;

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.layoutSubviewsBlock)
        self.layoutSubviewsBlock(self);
}

@end
