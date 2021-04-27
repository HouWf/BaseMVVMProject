//
//  JFLocation.m
//  Football
//
//  Created by 张志峰 on 16/6/7.
//  Copyright © 2016年 zhangzhifeng. All rights reserved.
//

#import "JFLocation.h"
#import "JFLocationWgs84ToGcj02.h"
#import <CoreLocation/CoreLocation.h>

@interface JFLocation ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation JFLocation

- (instancetype)init {
    if (self = [super init]) {
        [self startPositioningSystem];
    }
    return self;
}

- (void)startPositioningSystem {
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
}

- (BOOL)locationServiceEnable{
    
    BOOL enable = [CLLocationManager locationServicesEnabled];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (!enable || status < 3) {
        CLLocationManager  *locationManager = [[CLLocationManager alloc] init];
        [locationManager requestAlwaysAuthorization];
        [locationManager requestWhenInUseAuthorization];
        return NO;
    }

    return YES;
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    [STSingletonManager sharedManager].locationServiceAvailabel = YES;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(locating)]) {
            [self.delegate locating];
        }
    });
    CLLocation *newLocation = locations[0];
    CLLocationCoordinate2D oldCoordinate = [JFLocationWgs84ToGcj02 transformFromWGSToGCJ:[newLocation coordinate]];
    NSLog(@"经度：%f, 纬度：%f", oldCoordinate.latitude, oldCoordinate.longitude);
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            NSMutableDictionary *location = [placemark addressDictionary].mutableCopy;
            [location setValue:placemark.locality forKey:@"City"];
            // 省市区
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                if (self.delegate && [self.delegate respondsToSelector:@selector(currentLocation:longitude:latitude:)]) {
                    [self.delegate currentLocation:location longitude:oldCoordinate.longitude latitude:oldCoordinate.latitude ];
                }
            });
            
        }
    }];
    
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
         [STSingletonManager sharedManager].locationServiceAvailabel = NO;
    }
    else{
         [STSingletonManager sharedManager].locationServiceAvailabel = YES;
    }
//    switch (status) {
//        case kCLAuthorizationStatusAuthorizedWhenInUse:
//        case kCLAuthorizationStatusAuthorizedAlways:
//            [manager startUpdatingLocation];
//            break;
//        case kCLAuthorizationStatusDenied:
//            // 用户拒绝使用定位，可在此引导用户开启
//            [BFCSingletonManager sharedManager].locationServiceAvailabel = NO;
//            break;
//        case kCLAuthorizationStatusRestricted:
//            // 权限受限，可引导用户开启
//            [BFCSingletonManager sharedManager].locationServiceAvailabel = NO;
//            break;
//        case kCLAuthorizationStatusNotDetermined:
//            [self.locationManager startUpdatingLocation];
//            break;
//        default:
//            break;
//    }
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if ([error code] == kCLErrorDenied) {
        [STSingletonManager sharedManager].locationServiceAvailabel = NO;
        if (self.delegate && [self.delegate respondsToSelector:@selector(refuseToUsePositioningSystem:)]) {
            [self.delegate refuseToUsePositioningSystem:@"已拒绝使用定位系统"];
        }
    }
    if ([error code] == kCLErrorLocationUnknown) {
        [STSingletonManager sharedManager].errorLocationUnknown = YES;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(locateFailure:)]) {
                [self.delegate locateFailure:@"无法获取位置信息"];
                [TostaObject showTosta:@"获取地理位置超时，请关闭APP后，重新开启！" hideAfterDelay:1.5f];
            }
        });
    }
}

@end
