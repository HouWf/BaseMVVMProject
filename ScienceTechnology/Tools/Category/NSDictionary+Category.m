//
//  NSDictionary+Category.m
//  runtime
//
//  Created by lilei on 16/5/11.
//  Copyright © 2016年 lilei. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

+(instancetype)dictionaryWithObjects:(const id[])objects forKeys:(const id[])keys count:(NSUInteger)cnt
{
    NSMutableArray *validKeys = [NSMutableArray new];
    NSMutableArray *validObjs = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (objects[i] && keys[i])
        {
            [validKeys addObject:keys[i]];
            [validObjs addObject:objects[i]];
        }
    }
    
    return [self dictionaryWithObjects:validObjs forKeys:validKeys];
}

@end
