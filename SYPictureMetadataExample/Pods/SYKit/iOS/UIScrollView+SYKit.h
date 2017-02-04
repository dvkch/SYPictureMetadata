//
//  UIScrollView+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 16/09/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (SYKit)

- (void)sy_setContentSizeChangedBlock:(void(^)(CGSize newSize))block;

@end
