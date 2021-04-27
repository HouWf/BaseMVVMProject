//
//  STBaseModel.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseModel.h"

@implementation STBaseModel

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    STBaseModel *copyModel = [[[self class] allocWithZone:zone] init];
    
    NSDictionary *dic = self.mj_keyValues;
    STBaseModel *model = [STBaseModel mj_objectWithKeyValues:dic];
    copyModel = model;

    return copyModel;
}

@end
