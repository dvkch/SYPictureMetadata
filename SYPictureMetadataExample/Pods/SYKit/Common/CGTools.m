//
//  CGTools.c
//  SYKit
//
//  Created by Stanislas Chevallier on 14/07/13.
//  Copyright (c) 2013 Syan. All rights reserved.
//

CGRect CGRectCenteredInsideRectWithSize(CGRect inside, CGSize size, BOOL fromOutside)
{
    CGFloat minX = CGRectGetMinX(inside);
    CGFloat minY = CGRectGetMinY(inside);
    
    return CGRectMake((CGRectGetWidth (inside) - size.width ) / 2.f + (fromOutside ? minX : 0),
                      (CGRectGetHeight(inside) - size.height) / 2.f + (fromOutside ? minY : 0),
                      size.width,
                      size.height);
}

CGRect CGRectCenteredSquarreInsideRectWithSize(CGRect inside, CGFloat size, BOOL fromOutside)
{
    return CGRectCenteredInsideRectWithSize(inside, CGSizeMake(size, size), fromOutside);
}

CGRect CGRectInsetPercent(CGRect rect, CGFloat percentX, CGFloat percentY)
{
    CGFloat mw = percentX * rect.size.width;
    CGFloat mh = percentY * rect.size.height;
    return CGRectInset(rect, mw, mh);
}
