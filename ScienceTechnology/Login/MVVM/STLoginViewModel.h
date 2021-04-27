//
//  STLoginViewModel.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseViewModel.h"
#import "STUserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *Method_loadMainCtr = @"loadMainCtr";

@interface STLoginViewModel : STBaseViewModel

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *user_pwd;

- (RACSignal *)signalForLogin;

@end

NS_ASSUME_NONNULL_END
