//
//  STUserDefaultKeyManager.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STUserDefaultKeyManager : NSObject

// 用户是否登录/登录是否过期
UIKIT_EXTERN NSString *const USERDEFAULT_KEY_IFLOGIN;

// 用户名
UIKIT_EXTERN NSString *const USER_NAME;

// 用户密码
UIKIT_EXTERN NSString *const USER_PWD;

// 用户Token
UIKIT_EXTERN NSString *const USER_TOKEN;





@end

NS_ASSUME_NONNULL_END
