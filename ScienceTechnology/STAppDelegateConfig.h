//
//  STAppDelegateConfig.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STAppDelegateConfig : NSObject

singleton_interface(STAppDelegateConfig);

/**
 首次进入app选择网络问题

 @param application UIApplication
 @param launchOptions launchOptions
 */
- (void)appNetworkStatus:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

/**
 获取当最顶部视图

 */
- (UIViewController *)getCurrentViewController;

/**
 获取nav

 @param window window
 @return nav
 */
- (UINavigationController *)getNavigationCWithWindow:(UIWindow *)window;


/**
 适配iOS11+
 */
- (void)setUpFixiOS11;

/**
 键盘设置
 */
- (void)configureBoardManager;

/**
获取定位权限
*/
- (void)loacationManager;

/**
 退出登录
 */
- (void)loginOut;

@end

NS_ASSUME_NONNULL_END
