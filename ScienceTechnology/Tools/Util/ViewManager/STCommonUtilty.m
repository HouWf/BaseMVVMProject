//
//  STCommonUtilty.m
//  BFCompetition
//
//  Created by hzhy002 on 2019/9/17.
//  Copyright © 2019 hzhy001. All rights reserved.
//

#import "STCommonUtilty.h"

@implementation STCommonUtilty


+(TZImagePickerController *)TZImagePickersetWithMaxImagesCount:(NSInteger)maxImagesCount  columnNumber:(NSInteger)columnNumber isReturnAction:(BOOL)isReturnAction complete:(void(^)(NSArray<UIImage *> *photos, NSArray<PHAsset *>*assets))complete
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxImagesCount columnNumber:columnNumber  delegate:nil];
    imagePickerVc.isSelectOriginalPhoto = NO;
    imagePickerVc.allowTakePicture = NO;//是否允许相册中内嵌拍照
    imagePickerVc.allowPickingVideo = NO;//是否允许选择视频
    imagePickerVc.allowPickingImage = YES;//是否允许选择照片
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPreview = NO;
    //imagePickerVc.showSelectBtn = YES;
    //  照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = NO;
    //@weakify(self)
    [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectedOrignImage, NSArray<NSDictionary *> *info) {
        complete(photos,assets);
    }];
    if (!isReturnAction) {
        [[[STAppDelegateConfig sharedManager] getCurrentViewController] presentViewController:imagePickerVc animated:YES completion:nil];
    }
    return imagePickerVc;
    
}

@end
