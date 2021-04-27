//
//  STCommonUtilty.h
//  BFCompetition
//
//  Created by hzhy002 on 2019/9/17.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZImagePickerController.h"

NS_ASSUME_NONNULL_BEGIN

@interface STCommonUtilty : NSObject

/**
 图片选择器
 
 @param maxImagesCount  最多选择的数量 默认为9张
 @param columnNumber 一行显示的个数，默认显示4个
 @param isReturnAction 返回控制器处理 默认不再返回处理
 */
+(TZImagePickerController *)TZImagePickersetWithMaxImagesCount:(NSInteger)maxImagesCount columnNumber:(NSInteger)columnNumber isReturnAction:(BOOL)isReturnAction complete:(void(^)(NSArray<UIImage *> *photos, NSArray<PHAsset *>*assets))complete;

@end

NS_ASSUME_NONNULL_END
