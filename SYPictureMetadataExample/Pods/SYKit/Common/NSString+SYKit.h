//
//  NSString+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 27/10/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SYKit)

/**
 *  Returns a string without the white and new line characters at beginning and ending
 *
 *  @return Trimmed string
 */
- (instancetype)sy_stringByTrimmingWhiteCharacters;

@end
