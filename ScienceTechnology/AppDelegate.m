//
//  AppDelegate.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "AppDelegate.h"
#import "STAppDelegateConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    STAppDelegateConfig *config = [STAppDelegateConfig sharedManager];
    [config appNetworkStatus:application withOptions:launchOptions];
    [config setUpFixiOS11];
    [config configureBoardManager];
    [config loacationManager];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    
    BOOL ifLogin = [DCObjManager dc_readUserDataForKey:USERDEFAULT_KEY_IFLOGIN];
    UIViewController *ctr = nil;
    if (!ifLogin) {
        ctr = [[NSClassFromString(@"STLoginViewController") alloc] init];
        self.window.rootViewController = ctr;
        
    }
    else{
        ctr = [[NSClassFromString(@"STMainViewController") alloc] init];
        self.window.rootViewController = ctr;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// shemes
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    // bfcp://roomId=&imRoomId=&title=）"
    
    return YES;
}

// universal links
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler
{
    if([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]
    /*&& ![userActivity.webpageURL.absoluteString containsString:kWxApp_key]*/) {
//        NSURL *webpageURL = userActivity.webpageURL;
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive) {
            
        }
    }
    return YES;
}
@end
