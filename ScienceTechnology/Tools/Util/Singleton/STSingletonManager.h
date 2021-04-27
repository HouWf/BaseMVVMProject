//
//  STSingletonManager.h
//  BFCompetition
//
//  Created by hzhy001 on 2018/10/22.
//  Copyright © 2018年 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STSingletonManager : NSObject

//  商户入驻状态枚举
typedef NS_ENUM(NSInteger, kStoreAvailable) {
    kStoreEnterstatusDisable,
    kStoreEnterstatusEnable
};

singleton_interface(STSingletonManager);
// 用户信息被修改
@property (nonatomic, assign) BOOL userInfoChanged;

// 经纬度,城市名称
@property (nonatomic, copy) NSString *longitude, *latitude, *cityName, *Name;

//  用户拒绝定位 、当前无法定位
@property (nonatomic, assign) BOOL locationServiceAvailabel, errorLocationUnknown;

// 联系客服
@property (nonatomic, copy) NSString *qq, *phone;

// 个性标签选择的个数
@property (nonatomic, assign) NSInteger currentLabelsCount;

// 大厅信息
@property (nonatomic, copy) NSString *roomId, *imRoomId;

// 是否是我的大厅
@property (nonatomic, assign) BOOL isMyRoom;

@property (nonatomic, copy) NSString *currentGroupId;
// 仅做pop返回
@property (nonatomic, assign) BOOL signalPop;

@end
