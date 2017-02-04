//
//  UITableViewCell+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 12/04/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SYKit)

+ (CGFloat)sy_cellHeightForWidth:(CGFloat)width
              configurationBlock:(void(^)(UITableViewCell *sizingCell))configurationBlock NS_AVAILABLE_IOS(6_0);

@end
