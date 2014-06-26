//
//  SYMetadataBase.m
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYMetadataBase.h"

@implementation SYMetadataBase

-(id)initWithDic:(NSDictionary*)dic
{
    if(!dic) return nil;
    
    if(self = [super init])
    {
        _dic = dic;
    }
    
    return self;
}

-(NSObject *)objectForKeyString:(NSString *)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    return (NSArray*)obj;
}
-(NSObject *)objectForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

-(NSString*)stringForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isString = [obj isKindOfClass:[NSString class]];
    if(!isString && obj) {
        NSLog(@"Wrong type for key \"%@\", not a string : %@\n returning description", key, [[obj class] description]);
        return [obj description];
    }
    
    return (NSString*)obj;
}
-(NSString*)stringForKeyStringRef:(CFStringRef)key
{
    return [self stringForKeyString:(__bridge NSString *)key];
}

-(NSNumber*)numberForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isNumber = [obj isKindOfClass:[NSNumber class]];
    if(!isNumber && obj) {
        NSLog(@"Wrong type for key \"%@\", not a number : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSNumber*)obj;
}
-(NSNumber*)numberForKeyStringRef:(CFStringRef)key
{
    return [self numberForKeyString:(__bridge NSString *)(key)];
}

-(NSArray*)arrayForKeyString:(NSString*)key
{
    NSObject *obj = [self->_dic objectForKey:key];
    BOOL isArray = [obj isKindOfClass:[NSArray class]]; // if obj == nil, expression will evaluate false.
    if(!isArray) {
        NSLog(@"Wrong type for key \"%@\", not a array : %@", key, [[obj class] description]);
        return nil;
    }
    
    return (NSArray*)obj;
}
-(NSArray*)arrayForKeyStringRef:(CFStringRef)key
{
    return [self arrayForKeyString:(__bridge NSString *)(key)];
}

@end
