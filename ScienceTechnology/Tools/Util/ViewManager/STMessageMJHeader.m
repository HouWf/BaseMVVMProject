//
//  STMessageMJHeader.m
//  BFCompetition
//
//  Created by hzhy002 on 2019/8/12.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import "STMessageMJHeader.h"

@implementation STMessageMJHeader

- (instancetype)init{
    if (self == [super init]) {
        [self setTitle:@"上拉刷新数据" forState:MJRefreshStateIdle];
        [self setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
        [self setTitle:@"正在刷新数据..." forState:MJRefreshStateRefreshing];
    }
    return self;
}


@end
