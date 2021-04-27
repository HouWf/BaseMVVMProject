//
//  AxcAE_TabBarBadge.m
//  Axc_AEUI
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "AxcAE_TabBarBadge.h"

@implementation AxcAE_TabBarBadge

#pragma mark - 构造
- (instancetype)init{
    self = [super init];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configuration];
    }
    return self;
}
////////
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.layer.cornerRadius = self.frame.size.height/2.0;
}
#pragma mark - 配置实例
// 默认属性
- (void)configuration{
    self.backgroundColor = AxcAE_TabBarItemBadgeRed;
    self.textColor = [UIColor whiteColor];
    self.font = [UIFont boldSystemFontOfSize:10];
    self.textAlignment = NSTextAlignmentCenter;
    self.clipsToBounds = YES;
    self.automaticHidden = NO;
    self.badgeHeight = 15;
}
- (void)setBadgeText:(NSString *)badgeText{
    _badgeText = badgeText;
    self.text = _badgeText;
    if (_badgeText.integerValue) { // 是数字 或者不为0
        self.hidden = NO; // 不管咋地先取消隐藏
        if (_badgeText.integerValue > 99) {
            self.text = @"";
        }
    }else{ //
        if (!_badgeText.length) { // 不存在的空串
            self.hidden = self.automaticHidden;
        }
    }
    CGFloat H;
    CGFloat W;
    if (_badgeText.integerValue > 99) {
//        W = 10;
//        H = W;
        W = 25;
        H = self.badgeHeight;
        self.text = @"99+";
    }
    else if (_badgeText.integerValue == 0){
        W = 0;
        H = W;
    }
    else{
        W = _badgeText.length*9<15?15:_badgeText.length*9;
        H = self.badgeHeight;
    }
    if (badgeText.length != 1) {
        W += 8;
    }
    CGRect frame = self.frame;
    frame.size.width = W;
    frame.size.height = H;
    self.frame = frame;
}


@end
