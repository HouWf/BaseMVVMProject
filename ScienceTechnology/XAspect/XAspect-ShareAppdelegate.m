//
//  XAspect-ShareAppdelegate.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/26.
//

#import "AppDelegate.h"
#import "XAspect.h"
#import <UserNotifications/UserNotifications.h>

#define AtAspect ShareAppdelegate

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

@synthesizeNucleusPatch(Default,-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions);
@synthesizeNucleusPatch(Default,-, BOOL, application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation);
@synthesizeNucleusPatch(Default,-, void, applicationDidBecomeActive:(UIApplication *)application);
@synthesizeNucleusPatch(Default,-, BOOL, application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options);
@synthesizeNucleusPatch(Default,-, BOOL,application:(UIApplication *)application handleOpenURL:(NSURL *)url);

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}


AspectPatch(-, BOOL, application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation)
{
    
    return XAMessageForward(application:application openURL:url sourceApplication:sourceApplication annotation:annotation);
}

AspectPatch(-, BOOL, applicationDidBecomeActive:(UIApplication *)application)
{
    
    return XAMessageForward(applicationDidBecomeActive:application);
}

AspectPatch(-, BOOL, application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options)
{
    
    return XAMessageForward(application:app openURL:url options:options);
}

AspectPatch(-, BOOL, application:(UIApplication *)application handleOpenURL:(NSURL *)url)
{
    
    return XAMessageForward(application:application handleOpenURL:url);
}

@end

#undef AtAspectOfClass
#undef AtAspect
