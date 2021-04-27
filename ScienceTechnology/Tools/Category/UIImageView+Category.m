//
//  UIImageView+Category.m
//  TodayActing
//
//  Created by hzhy001 on 2018/9/10.
//  Copyright © 2018年 hzhy001. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

/*
 [self.companyLogoView sd_setImageWithURL:[NSURL URLWithString:_orderModel.activityPostModel.activityModel.storeModel.headPhoto] placeholderImage:GetImage(placeholderImgStr) options:SDWebImageProgressiveDownload|SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
 [self.companyLogoView addMaskToBounds:self.companyLogoView.frame cornerRadius:self.companyLogoView.image.size.width/2];
 }];
 */

- (void)addMaskToBounds:(CGRect)maskBounds cornerRadius:(CGFloat)cornerRadius{
    
    // 获取绘制圆的半径、宽、高的一个区域
    CGFloat radius = MIN(maskBounds.size.width, maskBounds.size.height)*0.5;
    CGFloat width = radius*2;
    CGFloat height = width;
    CGRect  rect  = CGRectMake(0, 0, width, height);
    if (cornerRadius < 0) {
        cornerRadius = 0;
    }
    else if (cornerRadius > MIN(width, height)){
        cornerRadius = MIN(width, height)/2;
    }
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(maskBounds.size, NO, 0.0);
    // 使用贝塞尔曲线裁切，先设置裁切路径，再绘制图像
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    // 裁剪路径
    [bezierPath addClip];
    // 讲图片汇智到裁切好的区域内
    UIImage *img = self.image;
    [img drawInRect:rect];
    // 从上线文获取当前支撑圆形的图片
    UIImage *rectImage = UIGraphicsGetImageFromCurrentImageContext();
    self.image = rectImage;
    // 关闭上下文
    UIGraphicsEndImageContext();
    [self layoutIfNeeded];
}

+ (UIImage *)cutImage:(UIImage*)image
{
    
    
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (390 / 272.32)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * 272.32 / 390;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * 390 / 272.32;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    
    return [UIImage imageWithCGImage:imageRef];
}

static NSData *data;
+ (NSString *) image2DataURL: (UIImage *) image{
    
    data = UIImageJPEGRepresentation(image, 1);
    
    NSLog(@"压缩前%fM",data.length / 1024.f / 1024.f);
    
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(image, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(image, 0.2);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(image, 0.5);
        }
    }
    
    NSLog(@"压缩后%fK",data.length / 1024.f);
    
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        
        mimeType = @"image/png";
    } else {
        
        mimeType = @"image/jpg";
    }
    NSLog(@"转码结束");
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [data base64EncodedStringWithOptions: 0]];
    
}

static NSData *imagedata;
+(UIImage *)compress:(UIImage *)oriImage{
    
    data=UIImageJPEGRepresentation(oriImage, 1);
    
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(oriImage, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(oriImage, 0.3);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(oriImage, 0.7);
        }
        
    }
    UIImage *xin = [UIImage imageWithData:data];
    return xin;
}

+ (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
