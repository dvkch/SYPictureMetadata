//
//  SYMetadataBase.h
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

#define SYPaste1(a,b)                   a##b
#define SYPaste(a,b)                    SYPaste1(a,b)
#define SYStringSel(sel)                NSStringFromSelector(@selector(sel))

@class SYPair<Object1Type, Object2Type>;

@interface SYMetadataBase : MTLModel <MTLJSONSerializing> {
@protected
    NSDictionary *_dic;
}

+ (NSDictionary <NSString *, SYPair <NSString *, Class> *> *)mapping;

- (NSObject *)objectForKeyString:(NSString *)key;
- (NSObject *)objectForKeyStringRef:(CFStringRef)key;

- (NSString *)stringForKeyString:(NSString *)key;
- (NSString *)stringForKeyStringRef:(CFStringRef)key;

- (NSNumber *)numberForKeyString:(NSString *)key;
- (NSNumber *)numberForKeyStringRef:(CFStringRef)key;

- (NSArray *)arrayForKeyString:(NSString *)key;
- (NSArray *)arrayForKeyStringRef:(CFStringRef)key;

@end
