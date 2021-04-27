//
//  NSMutableDictionary+Category.m
//  WaWaSchool
//
//  Created by 郭峰 on 2017/10/31.
//  Copyright © 2017年 Galaxy School. All rights reserved.
//

/*
 
 后续发现关于字典问题补充添加使用
 
 */
#import "NSMutableDictionary+Category.h"
#import "NSObject+ExchangeM.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (Category)

+ (void)load{
    [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(setObject:forKey:) swizzledSelector:@selector(mutablesetObject:forKey:)];
}

-(void)mutablesetObject:(id)object forKey:(NSString *)key
{
    @autoreleasepool {
    if(object){
        [self mutablesetObject:object forKey:key];
    }
  }
}
@end
