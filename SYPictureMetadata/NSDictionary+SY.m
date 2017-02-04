//
//  NSDictionary+SY.m
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 03/02/2017.
//  Copyright © 2017 Syan. All rights reserved.
//

#import "NSDictionary+SY.h"

@implementation NSDictionary (SY)

+ (NSDictionary *)sy_differencesFrom:(NSDictionary *)dictionaryOld to:(NSDictionary *)dictionaryNew;
{
    NSString *valueAdded    = @"added";
    NSString *valueUpdated  = @"updated";
    NSString *valueRemoved  = @"removed";
    
    NSMutableSet *allKeys = [NSMutableSet set];
    [allKeys addObjectsFromArray:dictionaryOld.allKeys];
    [allKeys addObjectsFromArray:dictionaryNew.allKeys];
    
    NSMutableDictionary *diffs = [[NSMutableDictionary alloc] init];
    for (id key in allKeys)
    {
        id valueOld = dictionaryOld[key];
        id valueNew = dictionaryNew[key];
        
        if ( valueOld && !valueNew)
        {
            [diffs setObject:valueRemoved forKey:key];
            continue;
        }
        
        if (!valueOld &&  valueNew)
        {
            [diffs setObject:valueAdded forKey:key];
            continue;
        }
        
        if ([valueOld isEqual:valueNew])
            continue;
        
        if ([valueOld isKindOfClass:[NSDictionary class]] &&
            [valueNew isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *subDiffs = [self sy_differencesFrom:valueOld to:valueNew];
            [diffs setObject:subDiffs forKey:key];
            continue;
        }
        
        [diffs setObject:valueUpdated forKey:key];
    }
    
    return [diffs copy];
}

- (NSArray <NSString *> *)sy_allKeypaths
{
    NSMutableArray <NSString *> *keypaths = [NSMutableArray array];
    
    for (id key in self.allKeys)
    {
        NSString *keyString = [key description];
        [keypaths addObject:keyString];
        
        id value = self[key];
        if ([value isKindOfClass:[NSDictionary class]])
        {
            for (NSString *subKeypath in [(NSDictionary *)value sy_allKeypaths])
                [keypaths addObject:[@[keyString, subKeypath] componentsJoinedByString:@"."]];
        }
    }
    
    return [keypaths copy];
}

@end
