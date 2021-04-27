//
//  UIImageView+Category.h
//  TodayActing
//
//  Created by hzhy001 on 2018/9/10.
//  Copyright © 2018年 hzhy001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

/**
 设置圆角
 
 @param maskBounds img.size
 @param cornerRadius 圆角大小
 */
- (void)addMaskToBounds:(CGRect)maskBounds cornerRadius:(CGFloat)cornerRadius;

/**
 切割图片
 
 @param image 切割前图片
 @return 切割后图片
 */
+ (UIImage *)cutImage:(UIImage*)image;

/**
 图片压缩并且转成base64字符串
 
 @param image 图片
 @return 转义后字符串
 */
+ (NSString *) image2DataURL: (UIImage *) image;

/**
 图片压缩
 
 @param oriImage 压缩前图片
 @return 压缩后
 */
+(UIImage *)compress:(UIImage *)oriImage;

/**
 转码 获取图片格式
 
 @param image 图片
 @return YES:png NO:jpg
 */
+ (BOOL) imageHasAlpha: (UIImage *) image;

/**
 颜色转图片
 
 @param color 颜色
 @return 图片
 */
+ (UIImage*) createImageWithColor: (UIColor*) color;

@end
