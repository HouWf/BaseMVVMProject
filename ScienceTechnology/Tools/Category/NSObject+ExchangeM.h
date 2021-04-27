//
//  NSObject+ExchangeM.h
//  internationalStudy
//
//  Created by lilei on 16/11/1.
//  Copyright © 2016年 lqwawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ExchangeM)
- (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end
