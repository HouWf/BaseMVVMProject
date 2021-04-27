//
//  UIImage+Category.h
//  51XiaoNiu
//
//  Created by 乔同新 on 16/4/6.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (Category)
//保持原来的长宽比，生成一个缩略图
+ (UIImage *_Nullable)thumbnailWithImageWithoutScale:(UIImage *_Nullable)image size:(CGSize)asize;
//content
+ (UIImage *_Nullable)contentFileWithName:(NSString *_Nullable)fileName Type:(NSString *_Nullable)type;
//返回一张自由拉伸的图片
+(UIImage *_Nullable)resizedImageWithName:(NSString *_Nullable)name;
//返回一张自由调整大小的图片
+(UIImage *_Nullable)newImageWithNamed:(NSString *_Nullable)name size:(CGSize)size;
///改变一张图片的大小
+ (UIImage *_Nullable)changeImageSize:(UIImage *_Nullable)icon AndSize:(CGSize)size;
+ (UIImage *_Nullable)imageWithOriginal:(NSString *_Nullable)imageName;
+ (UIImage *_Nullable)resizedImage:(NSString *_Nullable)name;
//根据颜色值生成纯色图片
+ (UIImage *_Nullable)createImageWithColor:(UIColor *_Nullable)color frame:(CGRect)frame;
//原图输出
+ (UIImage *_Nullable)imageWithName:(NSString *_Nullable)name size:(CGSize)size;
///压缩
+ (UIImage*_Nullable)imageWithImageSimple:(UIImage*_Nullable)image scaledToSize:(CGSize)newSize;
+ (UIImage *_Nullable)createThumbImage:(UIImage *_Nonnull)image size:(CGSize )thumbSize;
/**
 *  高斯模糊
 *
 *  @param view   view
 *  @param radius radius
 *  @param size   size
 *
 *  @return image
 */
+ (UIImage*_Nullable)imageWithView:(UIView*_Nullable)view radius:(CGFloat)radius size:(CGSize)size;

+ (UIImage *_Nullable)imageWithColor:(UIColor *_Nullable)color;

+ (UIImage *_Nullable)qrCodeImageWithContent:(NSString *_Nullable)content
                      codeImageSize:(CGFloat)size
                                        logo:(UIImage *_Nullable)logo
                          logoFrame:(CGRect)logoFrame
                                red:(CGFloat)red
                              green:(CGFloat)green
                               blue:(CGFloat)blue;

+ (UIImage *_Nullable)getTheLaunchImage;
+ (UIImage*_Nullable)imageWithUIView:(UIView*_Nullable)view;
- (UIImage *_Nullable)imageWithTitle:(NSString *_Nullable)title fontSize:(CGFloat)fontSize;
+ (CGSize)getImageSizeWithURL:(id _Nullable )URL;

/**
 将图片进行圆形切割处理，默认无边框(PS:此操作是线程安全的)。
 @param scaleSize 图片将会缩放成的目标大小
 @return 返回处理之后的图片
 */
- (nullable UIImage *)dd_imageByRoundScaleSize:(CGSize)scaleSize;

/**
 将图片进行圆角处理，并加上边框(PS:此操作是线程安全的)。
 @param radius 圆角大小
 @param scaleSize 图片将会缩放成的目标大小
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param corners 图片圆角样式（UIRectCorner）
 @return 返回处理之后的图片
 */
- (nullable UIImage *)dd_imageByCornerRadius:(CGFloat)radius
                                   scaleSize:(CGSize)scaleSize
                                 borderWidth:(CGFloat)borderWidth
                                 borderColor:(nullable UIColor *)borderColor
                                     corners:(UIRectCorner)corners;

/**
 图片加上圆形边框，图片必须得是正方形的，否则直接返回未加边框的原图片(PS:此操作是线程安全的)
 @param color 边框颜色
 @param width 边框宽度
 @return 返回处理之后的图片
 */
- (nullable UIImage *)dd_imageByRoundBorderedColor:(nullable UIColor *)color
                                       borderWidth:(CGFloat)width;

/**
 创建一张纯色的圆形图片
 @param color 图片填充的颜色
 @param size 图片的大小
 @return 返回纯色的圆形图片
 */
+ (nullable UIImage *)dd_roundImageWithColor:(nullable UIColor *)color
                                        size:(CGSize)size;

/**
 图片加上边框 (PS:此操作是线程安全的)
 @param radius 圆角大小
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param corners 图片圆角样式（UIRectCorner）
 @return 返回处理之后的图片
 */
- (nullable UIImage *)dd_imageByCornerRadius:(CGFloat)radius
                               borderedColor:(nullable UIColor *)borderColor
                                 borderWidth:(CGFloat)borderWidth
                                     corners:(UIRectCorner)corners;

/**
 将图片指定圆角样式处理，并加上边框(PS:此操作是线程安全的)。
 @param radius 圆角大小
 @param corners 图片圆角样式（UIRectCorner）
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return 返回处理之后的图片
 */
- (nullable UIImage *)dd_imageByCornerRadius:(CGFloat)radius
                                     corners:(UIRectCorner)corners
                                 borderWidth:(CGFloat)borderWidth
                                 borderColor:(nullable UIColor *)borderColor;

- (nullable UIImage*)imageChangeColor:(UIColor *_Nonnull)color;

/// 压缩拖到指定内存大小
/// @param image 目标图片
/// @param kb 压缩大小
+ (UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;

@end
NS_ASSUME_NONNULL_END
