//
//  STUserInfoModel.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface STUserInfoModel : STBaseModel<NSCoding>


@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *logo;

@property (nonatomic, copy) NSString *userCode;

@property (nonatomic, copy) NSString *accessToken;

@property (nonatomic, copy) NSString *openId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *userPwd;

@property (nonatomic, assign) BOOL inited;

/**
 *  归档保存用户数据
 */
-(void)saveUserInfo;

/**
 *  归档保存用户数据
 */
-(void)removeUserInfo;
/**
 *  归档读取用户数据
 *
 *  @return 用户的数据模型
 */
+(instancetype)readUserInfo;

@end

NS_ASSUME_NONNULL_END
