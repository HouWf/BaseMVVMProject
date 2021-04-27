//
//  TostaObject.h
//  AutoLayoutForCell
//
//  Created by hzhy001 on 2018/5/11.
//  Copyright © 2018年 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TostaObject : NSObject

+ (void)showTosta:(NSString *)msg enable:(BOOL)enable hideAfterDelay:(NSTimeInterval)times;

+(void)showTosta:(NSString *)msg hideAfterDelay:(NSTimeInterval)times;

+(void)showTitle:(NSString *)title DetailTosta:(NSString *)detailMsg hideAfterDelay:(NSTimeInterval)times;

+ (void)showHUD;

+ (void)hiddenHUD;

@end
