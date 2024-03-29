//
//  Network.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  数据请求类

#import <Foundation/Foundation.h>

typedef void(^NetworkSucess) (NSDictionary * response);
typedef void(^NetworkFailure) (NSError *error);

@interface NetworkModel : NSObject

@property (nonatomic, copy) NSString *beginTime;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger weight;

@end

@interface Network : NSObject

/**
 *  此处用于模拟广告数据请求,实际项目中请做真实请求
 */
+(void)getLaunchAdImageDataSuccess:(NetworkSucess)success failure:(NetworkFailure)failure;
+(void)getLaunchAdVideoDataSuccess:(NetworkSucess)success failure:(NetworkFailure)failure;

@end
