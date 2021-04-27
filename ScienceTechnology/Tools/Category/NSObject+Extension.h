//
//  NSObject+Extension.h
//  BFPlus
//
//  Created by hzhy001 on 2018/12/18.
//  Copyright © 2018 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extension)

/// 查到当前类方法并运行

- (BOOL)canRunToSelector:(SEL)aSelector;

- (id)runSelector:(SEL)aSelector withObjects:(NSArray * _Nullable)objects;

/// 调用当前及父类方法 结合[self respondsToSelector:selector]使用
- (void)runSuperSelector:(SEL)selector withObjects:(NSObject * _Nullable)objects;

@end

NS_ASSUME_NONNULL_END
