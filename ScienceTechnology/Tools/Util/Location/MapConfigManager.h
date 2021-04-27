//
//  MapConfigManager.h
//  MapDemo
//
//  Created by hzhy001 on 2019/3/20.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, kMapPlateform) {
    kMapPlateformApple = 0,
    kMapPlateformBaidu,
    kMapPlateformGaode,
    kMapPlateformTencent,
    kMapPlateformGoogle
};

@interface MapConfigManager : NSObject

/**
 一键唤起三方地图导航

 @param viewController 当前vc
 @param latitude 经度
 @param longitude 纬度
 @param addressName 名称
 @param plateforms 支持平台 默认支持：原生地图、百度、高德、腾讯、谷歌
 @return MapConfigManager
 */
+ (instancetype)showMapUiWithViewController:(UIViewController *)viewController
                                   latitude:(NSString *)latitude
                                  longitude:(NSString *)longitude
                                addressName:(NSString *)addressName
                         supportPlateformas:(NSArray <NSNumber *>*)plateforms;

@end

NS_ASSUME_NONNULL_END
