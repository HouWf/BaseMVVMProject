//
//  XAspect-PushAppdelegate.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/26.
//

#import "AppDelegate.h"
#import "XAspect.h"
#import <UserNotifications/UserNotifications.h>

#define AtAspect PushAppdelegate

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)


@end

#undef AtAspectOfClass
#undef AtAspect
