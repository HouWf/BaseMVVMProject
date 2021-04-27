//
//  STAppDelegateConfig.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/26.
//

#import "STAppDelegateConfig.h"
#import <CoreTelephony/CTCellularData.h>
#import "JFLocation.h"
#import "STLoginViewController.h"

@implementation STAppDelegateConfig

singleton_implementation(STAppDelegateConfig);

- (void)appNetworkStatus:(UIApplication *)application withOptions:(NSDictionary *)launchOptions{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //1.获取网络权限 根绝权限进行人机交互
         if (__IPHONE_10_0) {
             [self networkStatus:application didFinishLaunchingWithOptions:launchOptions];
         }else {
             //2.2已经开启网络权限 监听网络状态
             [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
         }
    });
}

/*
 CTCellularData在iOS9之前是私有类，权限设置是iOS10开始的，所以App Store审核没有问题
 获取网络权限状态
 */
- (void)networkStatus:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //2.根据权限执行相应的交互
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    
    /*
     此函数会在网络权限改变时再次调用
     */
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        switch (state) {
            case kCTCellularDataRestricted:
                
                NSLog(@"蜂窝移动网络状态：关闭");
                //2.1权限关闭的情况下 弹出设置网络提示
                [self showSettingAlert];
                break;
            case kCTCellularDataNotRestricted:
                
                NSLog(@"蜂窝移动网络状态：开启");
                //2.2已经开启网络权限 监听网络状态
                [self addReachabilityManager:application didFinishLaunchingWithOptions:launchOptions];
                break;
            case kCTCellularDataRestrictedStateUnknown:
                
                NSLog(@"蜂窝移动网络状态：未知");
                //2.3未知情况 （还没有遇到推测是有网络但是连接不正常的情况下）
                
                break;
                
            default:
                break;
        }
    };
}

/**
 实时检查当前网络状态
 */
- (void)addReachabilityManager:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    
    //这个可以放在需要侦听的页面
    [afNetworkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"网络不通：%@",@(status) );
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"网络通过WIFI连接：%@",@(status));
                [self getInfo_application:application didFinishLaunchingWithOptions:launchOptions];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"网络通过无线连接：%@",@(status) );
                [self getInfo_application:application didFinishLaunchingWithOptions:launchOptions];
                break;
            }
            default:
                break;
        }
    }];
    
    [afNetworkReachabilityManager startMonitoring];  //开启网络监视器；
}

-(void)showSettingAlert{

    dispatch_async(dispatch_get_main_queue(), ^{
        [[AlertView shareAlertView] showAlertViewWithTitle:@"提示" message:@"蜂窝移动网络状态：关闭\n是否前往开启" actionTitle:@"取消" otherTitle:@"设置" target:[UIApplication sharedApplication].keyWindow.rootViewController block:^(NSInteger index) {
            if (index == 1) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }];
    });
}

- (void)getInfo_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_home" object:nil];
}


- (UIViewController *)getCurrentViewController{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIViewController *topViewController = [window rootViewController];
    
    while (true) {
        
        if (topViewController.presentedViewController) {
            
            topViewController = topViewController.presentedViewController;
            
        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController]) {
            
            topViewController = [(UINavigationController *)topViewController topViewController];
            
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
            
        } else {
            break;
        }
    }
    return topViewController;
}

- (UINavigationController *)getNavigationCWithWindow:(UIWindow *)window;{
    UITabBarController *tabVC = (UITabBarController  *)window.rootViewController;
    UINavigationController *pushClassStance = (UINavigationController *)tabVC.viewControllers[tabVC.selectedIndex];
    return pushClassStance;
    /*
     UIViewController *detailVC = [UIViewController new];
     UINavigationController *navVc = [[BFCAppViewModel shareManager] getNavigationCWithWindow:self.window];
     if ([navVc.visibleViewController isKindOfClass:vc_class]) {
        return;
     }
     else{
        [navVc pushViewController:detailVC animated:YES]
     }
     */
}

/**
 适配iOS 11+
 */
- (void)setUpFixiOS11{
    if (@available(ios 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}

/**
 键盘设置
 */
- (void)configureBoardManager{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
    manager.canAdjustTextView = YES;
}

- (void)loacationManager{
    [[[JFLocation alloc] init] locationServiceEnable];
}

- (void)loginOut{
    [self exitCleanCookies];
    void(^resetRootCtr)(void) = ^(){
        [DCObjManager dc_removeUserDataForkey:USERDEFAULT_KEY_IFLOGIN];
        [[STUserInfoModel readUserInfo] removeUserInfo];
        STLoginViewController *loginVc = [[STLoginViewController alloc] init];
        STBaseNavigationController *nav = [[STBaseNavigationController alloc] initWithRootViewController:loginVc];
        [UIApplication sharedApplication].delegate.window.rootViewController = nav;
    };
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].delegate.window animated:YES];
        resetRootCtr();
    });
    
}

/**
 清除cookie
 */
- (void)exitCleanCookies{
    
    //获取BaseUrl 的Cookie
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:server_ip_url]];
    for (NSHTTPCookie * cookie in cookies){
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}

@end
