//
//  MapConfigManager.m
//  MapDemo
//
//  Created by hzhy001 on 2019/3/20.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import "MapConfigManager.h"
#import "MapManager.h"

@interface MapConfigManager ()

@property (nonatomic, strong) UIAlertController *alertView;

@property (nonatomic, strong) UIViewController *viewController;

@property (nonatomic, strong) NSArray *schems, *plateforms;

@property (nonatomic, copy) NSString *latitude, *longitude, *addressName;

@end

@implementation MapConfigManager

+ (instancetype)showMapUiWithViewController:(UIViewController *)viewController
                                   latitude:(NSString *)latitude
                                  longitude:(NSString *)longitude
                                addressName:(NSString *)addressName
                         supportPlateformas:(NSArray <NSNumber *>*)plateforms{
    MapConfigManager *config = [[MapConfigManager alloc] init];
    [config show:viewController
        latitude:latitude
       longitude:longitude
     addressName:addressName
      plateforms:plateforms];
    
    return config;
}

- (void)show:(UIViewController *)viewController
    latitude:(NSString *)latitude
   longitude:(NSString *)longitude
 addressName:(NSString *)addressName
  plateforms:(NSArray *)platforms{
    self.viewController = viewController;
    self.latitude = latitude;
    self.longitude = longitude;
    self.addressName = addressName;
    self.plateforms = platforms;
    if (self.plateforms.count == 0 || self.plateforms == nil) {
        self.plateforms = @[@(kMapPlateformApple),
                            @(kMapPlateformBaidu),
                            @(kMapPlateformGaode),
                            @(kMapPlateformTencent),
                            @(kMapPlateformGoogle)];
    }
   
    [self showAlert];
}

- (void)showAlert{
    self.alertView = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil
                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    [self.plateforms enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *dic = [self.schems objectAtIndex:[number integerValue]];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:dic[@"url"]]]) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:dic[@"title"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if ([dic[@"url"] isEqualToString:@"baidumap://"])
                {
                    [[MapManager sharedManager] baiduLocationWithLat:self.latitude
                                                                lon:self.longitude
                                                        addressName:self.addressName];
                }
                else if ([dic[@"url"] isEqualToString:@"iosamap://"])
                {
                    [[MapManager sharedManager] gaodeLocationWithLat:self.latitude
                                                                lon:self.longitude
                                                        addressName:self.addressName];
                }
                else if ([dic[@"url"] isEqualToString:@"qqmap://"])
                {
                    [[MapManager sharedManager] tencentLocationWithLat:self.latitude
                                                                  lon:self.longitude
                                                          addressName:self.addressName];
                }
                else if ([dic[@"url"] isEqualToString:@"comgooglemaps://"])
                {
                    [[MapManager sharedManager] googleLocationWithLat:self.latitude
                                                                 lon:self.longitude
                                                         addressName:self.addressName];
                }
                else{
                    [[MapManager sharedManager] mapAppleWithLat:self.latitude
                                                           lon:self.longitude
                                                   addressName:self.addressName];
                }
            }];
            [self.alertView addAction:action];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [self.alertView addAction:cancelAction];
    
    [self.viewController presentViewController:self.alertView
                                      animated:YES
                                    completion:nil];
}

- (NSArray *)schems{
    if (!_schems) {
        _schems = @[@{
                            @"title":@"Apple地图",
                            @"url":@"http://maps.apple.com/"
                            },
                        @{
                            @"title":@"百度地图",
                            @"url":@"baidumap://"
                            },
                        @{
                            @"title":@"高德地图",
                            @"url":@"iosamap://"
                            },
                        @{
                            @"title":@"腾讯地图",
                            @"url":@"qqmap://"
                            },
                        @{
                            @"title":@"谷歌地图",
                            @"url":@"comgooglemaps://"
                            }];
        
    }
    return _schems;
}

- (UIAlertController *)alertView{
    if (!_alertView) {
        _alertView = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil
                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    }
    return _alertView;
}

@end
