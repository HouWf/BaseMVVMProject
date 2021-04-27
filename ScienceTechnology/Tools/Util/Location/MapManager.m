//
//  MapManager.m
//  MapDemo
//
//  Created by hzhy001 on 2019/3/20.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import "MapManager.h"
#import <MapKit/MapKit.h>

@interface MapManager ()

@property (nonatomic, strong) UIAlertController *alertVeiw;

@property (nonatomic, strong) NSMutableArray *schems;

@end

@implementation MapManager

singleton_implementation(MapManager);
//    coord_type=wgs84 GPS定位 bd09ll（百度经纬度坐标）bd09mc（百度墨卡托坐标）gcj02（经国测局加密的坐标) wgs84（gps获取的原始坐标）

/**
 跳转Apple地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 地址名称
 */
- (void)mapAppleWithLat:(NSString *)lat
                    lon:(NSString *)lon
            addressName:(NSString *)adname{
    CLLocationCoordinate2D coor2d = [self getCoord2DWithLat:lat lon:lon];
    MKPlacemark *mark = [[MKPlacemark alloc] initWithCoordinate:coor2d addressDictionary:nil];
    
    MKMapItem *fromLocation = [MKMapItem mapItemForCurrentLocation];
    fromLocation.name = @"我的位置";
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:mark];
    toLocation.name = adname;
    [MKMapItem openMapsWithItems:@[fromLocation, toLocation]
                   launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
}

/**
 百度地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 coord_type 坐标系 wgs84 世界 gcj02 国标 bd09ll，bd09mc 百度
 */
- (void)baiduLocationWithLat:(NSString *)lat
                         lon:(NSString *)lon
                 addressName:(NSString *)adname{
    //坐标转换
    CLLocationCoordinate2D afterLocation = [self getCoord2DWithLat:lat lon:lon];
    NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name:%@&coord_type=gcj02&mode=driving&src=com.huizhihuyu.bfcp",afterLocation.latitude, afterLocation.longitude, adname]
                           stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self openUrlString:urlString];
}

/**
 高德地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 dev 1 需要进行国策加密， 0 不需要国策加密
 */
- (void)gaodeLocationWithLat:(NSString *)lat
                         lon:(NSString *)lon
                 addressName:(NSString *)adname{
    
    CLLocationCoordinate2D afterLocation = [self getCoord2DWithLat:lat lon:lon];
    NSString *urlString = [[NSString stringWithFormat:@"iosamap://path?sourceApplication=MapDemo&sid=BGVIS1&sname=%@&did=BGVIS2&dlat=%f&dlon=%f&dname=%@&dev=0&m=0&t=0",@"我的位置",afterLocation.latitude, afterLocation.longitude, adname]
                           stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self openUrlString:urlString];
}

/**
 腾讯地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 coord_typ 1 GPS 2 腾讯坐标（默认）
 */
- (void)tencentLocationWithLat:(NSString *)lat
                           lon:(NSString *)lon
                   addressName:(NSString *)adname{
    CLLocationCoordinate2D desCoordinate = [self getCoord2DWithLat:lat lon:lon];
    
    NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&from=我的位置&fromcoord=CurrentLocation&to=%@&tocoord=%f,%f&policy=1&coord_typ=1&referer=6NYBZ-DRDWG-VYPQR-IZ2V3-PNJI7-GWFTO", adname, desCoordinate.latitude, desCoordinate.longitude]
                           stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self openUrlString:urlString];
}

/**
 谷歌地图
 
 @param lat 经度
 @param lon 纬度
 @param adname 名称
 */
- (void)googleLocationWithLat:(NSString *)lat
                          lon:(NSString *)lon
                  addressName:(NSString *)adname{
    
    CLLocationCoordinate2D afterLocation = [self getCoord2DWithLat:lat lon:lon];
    NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",@"我的位置",adname,afterLocation.latitude, afterLocation.longitude]
                           stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self openUrlString:urlString];
}

- (void)openUrlString:(NSString *)urlString{
    //iOS10以后,使用新API
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
            NSLog(@"scheme调用结束");
        }];
    } else {
        // Fallback on earlier versions
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
}

/**
 获取2D
 
 @param lat 经度
 @param lon 纬度
 */
- (CLLocationCoordinate2D)getCoord2DWithLat:(NSString *)lat
                                        lon:(NSString *)lon{
    CLLocationDegrees newLat = [lat doubleValue];
    CLLocationDegrees newLon = [lon doubleValue];
    CLLocationCoordinate2D coor2d = CLLocationCoordinate2DMake(newLat, newLon);
    return coor2d;
}

@end
