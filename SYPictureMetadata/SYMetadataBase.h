//
//  SYMetadataBase.h
//  SYPictureMetadataExample
//
//  Created by rominet on 12/13/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYMetadataBase : NSObject {
@protected
    NSDictionary *_dic;
}

-(id)initWithDic:(NSDictionary*)dic;

@property (readonly, nonatomic, getter = getDictionary) NSDictionary* dictionary;

-(NSObject*)objectForKeyString:(NSString*)key;
-(NSObject*)objectForKeyStringRef:(CFStringRef)key;

-(NSString*)stringForKeyString:(NSString*)key;
-(NSString*)stringForKeyStringRef:(CFStringRef)key;

-(NSNumber*)numberForKeyString:(NSString*)key;
-(NSNumber*)numberForKeyStringRef:(CFStringRef)key;

-(NSArray*)arrayForKeyString:(NSString*)key;
-(NSArray*)arrayForKeyStringRef:(CFStringRef)key;

@end
