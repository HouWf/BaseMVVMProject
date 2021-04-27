//
//  TostaObject.m
//  AutoLayoutForCell
//
//  Created by hzhy001 on 2018/5/11.
//  Copyright © 2018年 hzhy001. All rights reserved.
//

#import "TostaObject.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface TostaObject ()

@property (nonatomic, strong) MBProgressHUD *mainHud;

@end

@implementation TostaObject

//弹出可分行的tosta提示
+ (void)showTosta:(NSString *)msg enable:(BOOL)enable hideAfterDelay:(NSTimeInterval)times{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.detailsLabel.text = msg;
    HUD.mode = MBProgressHUDModeText;
    HUD.userInteractionEnabled = enable;
    HUD.margin = 7.5;
//    HUD.offset = CGPointMake(100.0f, 150.0f);
    [HUD hideAnimated:YES afterDelay:times];
}

//弹出可分行的tosta提示
+(void)showTosta:(NSString *)msg hideAfterDelay:(NSTimeInterval)times
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:appdel.window];
    HUD.removeFromSuperViewOnHide = YES;
    [appdel.window addSubview:HUD];
    HUD.detailsLabel.text = msg;
    HUD.mode = MBProgressHUDModeText;
    HUD.margin = 7.5;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:times];
}

+(void)showTitle:(NSString *)title DetailTosta:(NSString *)detailMsg hideAfterDelay:(NSTimeInterval)times
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:appdel.window];
    HUD.removeFromSuperViewOnHide = YES;
    [appdel.window addSubview:HUD];
    HUD.label.text = title;
    HUD.detailsLabel.text = detailMsg;
    HUD.mode = MBProgressHUDModeText;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:times];
    
}

+ (void)showHUD{
    WEAK
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    });
}

+ (void)hiddenHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    });
}

@end
