//
//  NSString+SYKit.m
//  SYKit
//
//  Created by Stan Chevallier on 27/10/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import "NSString+SYKit.h"

@implementation NSString (SYKit)

- (instancetype)sy_stringByTrimmingWhiteCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
