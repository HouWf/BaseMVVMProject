//
//  STMessageMJFooter.m
//  BFCompetition
//
//  Created by hzhy002 on 2019/8/12.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import "STMessageMJFooter.h"

@implementation STMessageMJFooter

- (instancetype)init{
    if (self == [super init]) {
        [self setTitle:@"上拉可以加载更多" forState:MJRefreshStateIdle];
        [self setTitle:@"松开立即加载" forState:MJRefreshStatePulling];
        [self setTitle:@"正在加载数据中..." forState:MJRefreshStateRefreshing];
        [self setTitle:@"别扒拉了，没有更多的啦！" forState:MJRefreshStateNoMoreData];
//        self.stateLabel.textColor = COLOR_8A9199;
        self.stateLabel.font = DEFAULTFONT(12);
    }
    return self;
}

@end
