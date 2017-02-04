//
//  CGTools.h
//  SYKit
//
//  Created by Stanislas Chevallier on 14/07/13.
//  Copyright (c) 2013 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef __CGTOOLS_H__
#define __CGTOOLS_H__

CGRect CGRectCenteredInsideRectWithSize(CGRect inside, CGSize size, BOOL fromOutside);
CGRect CGRectCenteredSquarreInsideRectWithSize(CGRect inside, CGFloat size, BOOL fromOutside);
CGRect CGRectInsetPercent(CGRect rect, CGFloat percentX, CGFloat percentY);

#endif