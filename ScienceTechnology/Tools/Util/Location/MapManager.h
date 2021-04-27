//
//  MapManager.h
//  MapDemo
//
//  Created by hzhy001 on 2019/3/20.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapManager : NSObject

singleton_interface(MapManager);

/**
 跳转Apple地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 地址名称
 */
- (void)mapAppleWithLat:(NSString *)lat
                    lon:(NSString *)lon
            addressName:(NSString *)adname;

/**
 百度地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 */
- (void)baiduLocationWithLat:(NSString *)lat
                         lon:(NSString *)lon
                 addressName:(NSString *)adname;

/**
 高德地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 */
- (void)gaodeLocationWithLat:(NSString *)lat
                         lon:(NSString *)lon
                 addressName:(NSString *)adname;

/**
 腾讯地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 */
- (void)tencentLocationWithLat:(NSString *)lat
                           lon:(NSString *)lon
                   addressName:(NSString *)adname;

/**
 谷歌地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 */
- (void)googleLocationWithLat:(NSString *)lat
                          lon:(NSString *)lon
                  addressName:(NSString *)adname;

@end

NS_ASSUME_NONNULL_END
