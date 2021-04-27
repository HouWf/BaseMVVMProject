//
//  Network.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  数据请求类
#import "Network.h"

@implementation NetworkModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
        @"status":@"status.name"
    };
}

@end

@implementation Network

/**
 *  此处模拟广告数据请求,实际项目中请做真实请求
 */
+(void)getLaunchAdImageDataSuccess:(NetworkSucess)success failure:(NetworkFailure)failure;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

//        [[BFCRequestManager sharedManager] getSimpleAdWithType:APP_AD_ENTRY showHud:NO success:^(NSDictionary *response) {
//            NetworkModel *model = [NetworkModel mj_objectWithKeyValues:response[@"data"]];
//            if (![model.status isEqualToString:@"ENABLE"]) {
//                NSError *error = [NSError errorWithDomain:@"不可用" code:201 userInfo:nil];
//                failure(error);
//            }
//            else{
//                // 如果上架，取当前时间与结束、开始时间对比
//                NSDate *beginDate = [NSString getDateWithString:model.beginTime format:DEFAULT_SLASH_SS_DATE_FORMAT];
//                NSDate *endDate = [NSString getDateWithString:model.endTime format:DEFAULT_SLASH_SS_DATE_FORMAT];
//                NSDate *currentDate = [NSDate date];
//                NSInteger beginResult = [NSString compareOneDay:currentDate withAnotherDay:beginDate format:DEFAULT_SLASH_SS_DATE_FORMAT];
//                NSInteger endResult = [NSString compareOneDay:currentDate withAnotherDay:endDate format:DEFAULT_SLASH_SS_DATE_FORMAT];
//                if (beginResult == 1 && endResult == -1) {
//                    NSString *size = [NSString stringWithFormat:@"%.1fx%.1f", Main_Screen_Width, Main_Screen_Height];
//                    NSDictionary *dic = @{
//                                            @"content":model.pic,
//                                            @"openUrl":model.url,
//                                            @"contentSize":size,
//                                            @"duration":@(3)
//                                            };
//                    if(success) success(dic);
//                }
//                else{
//                    NSError *error = [NSError errorWithDomain:@"已过期" code:201 userInfo:nil];
//                    failure(error);
//                }
//            }
//
//        } failure:^(NSError *error) {
//            failure(error);
//        }];
        
        
//        NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchImageAd" ofType:@"json"]];
//        NSDictionary *json =  [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
//        if(success) success(json);

    });
}
/**
 *  此处模拟广告数据请求,实际项目中请做真实请求
 */
+(void)getLaunchAdVideoDataSuccess:(NetworkSucess)success failure:(NetworkFailure)failure;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchVideoAd" ofType:@"json"]];
        NSDictionary *json =  [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
        if(success) success(json);
        
    });
}
@end
