//
//  STLoginViewModel.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STLoginViewModel.h"

@implementation STLoginViewModel

- (RACSignal *)signalForLogin{
    RACReplaySubject *subject = [RACReplaySubject subject];

    NSDictionary *dic = @{
        @"token":@"token",
        @"userId":@"userId",
        @"nickName":@"这是昵称",
        @"logo":@"logo",
        @"userCode":@"userCode",
        @"accessToken":@"accessToken",
        @"openId":@"openId",
        @"userName":self.user_name,
        @"userPwd":self.user_pwd
    };
    
    STUserInfoModel *model = [STUserInfoModel mj_objectWithKeyValues:dic];
    [model saveUserInfo];
    [DCObjManager dc_saveUserData:@(1) forKey:USERDEFAULT_KEY_IFLOGIN];
    [subject sendNext:model];
    [subject sendCompleted];
    
    return subject;
}

@end
