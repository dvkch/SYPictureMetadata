//
//  SYMetadataBase.m
//  SYPictureMetadataExample
//
//  Created by Stan Chevallier on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"
#import <SYPair.h>

@implementation SYMetadataBase

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    static dispatch_once_t onceToken;
    static NSDictionary <NSString *, NSString *> *instance;
    dispatch_once(&onceToken, ^{
        
        NSDictionary <NSString *, SYPair <NSString *, Class> *> *mapping = [self mapping];
        NSMutableDictionary <NSString *, NSString *> *keyToJson = [NSMutableDictionary dictionary];
        for (NSString *key in mapping)
            keyToJson[key] = mapping[key].object1;
        
        instance = [keyToJson copy];
    });
    return instance;
}

- (id)initWithDic:(NSDictionary*)dic
{
    if (self = [super init])
    {
        self->_dic = dic;
    }
    
    if (!dic)
        return nil;
    
    return self;
}

+ (NSDictionary <NSString *, SYPair <NSString *, Class> *> *)mapping
{
    return @{};
}

- (NSObject *)objectForKeyString:(NSString *)key
{
    return [self->_dic objectForKey:key];
}

- (NSObject *)objectForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

- (NSString *)stringForKeyString:(NSString *)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isString = [obj isKindOfClass:[NSString class]];
    if (!isString && obj) {
        NSLog(@"Wrong type for key \"%@\", not a string : %@\n returning description", key, [[obj class] description]);
        return [obj description];
    }
    
    return (NSString*)obj;
}

- (NSString *)stringForKeyStringRef:(CFStringRef)key
{
    return [self stringForKeyString:(__bridge NSString *)key];
}

- (NSNumber *)numberForKeyString:(NSString *)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isNumber = [obj isKindOfClass:[NSNumber class]];
    if (!isNumber && obj) {
        NSLog(@"Wrong type for key \"%@\", not a number : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSNumber*)obj;
}

- (NSNumber *)numberForKeyStringRef:(CFStringRef)key
{
    return [self numberForKeyString:(__bridge NSString *)(key)];
}

- (NSArray *)arrayForKeyString:(NSString *)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isArray = [obj isKindOfClass:[NSArray class]];
    if (!isArray && obj) {
        NSLog(@"Wrong type for key \"%@\", not a array : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSArray *)obj;
}

- (NSArray *)arrayForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

@end
