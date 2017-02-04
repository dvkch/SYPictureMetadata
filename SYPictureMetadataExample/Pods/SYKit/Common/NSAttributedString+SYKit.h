//
//  NSAttributedString+SYKit.h
//  SYKit
//
//  Created by Stan Chevallier on 07/09/2016.
//  Copyright © 2016 Syan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (SYKit)

/**
 *  Creates a new attributed string using the provided text, font and color
 *
 *  @param text  text for the attributed string
 *  @param font  font (optional)
 *  @param color color (optional)
 *
 *  @return New attributed string
 */
+ (instancetype)sy_stringWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;

/**
 *  Concatenates attributes strings into a single one
 *
 *  @param strings strings to concatenate
 *
 *  @return New attributed string
 */
+ (instancetype)sy_stringWithStrings:(NSArray <NSAttributedString *> *)strings;

/**
 *  Concatenates attributes strings into a single one, with the option to append line breaks between them
 *
 *  @param strings      strings to concatenate
 *  @param addLineBreak determines if a line break should be added between each strings
 *
 *  @return New attributed string
 */
+ (instancetype)sy_stringWithStrings:(NSArray <NSAttributedString *> *)strings addLineBreak:(BOOL)addLineBreak;

/**
 *  Creates an attributed string with the given image
 *
 *  @param image            image for new string
 *  @param verticalOffset   vertical offset for image
 *
 *  @return New attributed string
 */
+ (NSAttributedString *)sy_stringWithImage:(UIImage *)image verticalOffset:(CGFloat)verticalOffset;

/**
 *  Determines the size the receiver would have if constrained to the given size
 *
 *  @param size bounding size
 *
 *  @return Estimated size
 */
- (CGSize)sy_sizeInBoundingSize:(CGSize)size;

/**
 *  Determines the size the receiver would have if constrained to the given width, without any limitation on the height
 *
 *  @param width bounding width
 *
 *  @return Estimated size
 */
- (CGSize)sy_sizeInBoundingWidth:(CGFloat)width;

@end
