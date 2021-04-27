//
//  DCObjManager.h
//  CDDKit
//
//  Created by apple on 2017/10/8.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCObjManager : NSObject

#pragma 把对象归档存到沙盒里
+(void)dc_saveObject:(id)object byFileName:(NSString*)fileName;

#pragma 通过文件名从沙盒中找到归档的对象
+(id)dc_getObjectByFileName:(NSString*)fileName;

#pragma 根据文件名删除沙盒中的 plist 文件
+(void)dc_removeFileByFileName:(NSString*)fileName;

//+ (void)saveUserInfo:(id)object;

#pragma 存储用户偏好设置 到 NSUserDefults
+(void)dc_saveUserData:(id)data forKey:(NSString*)key;

#pragma 读取用户偏好设置
+(id)dc_readUserDataForKey:(NSString*)key;

#pragma 删除用户偏好设置
+(void)dc_removeUserDataForkey:(NSString*)key;

/*   保存图片   */
#pragma 保存网络图片
+ (void)saveUrlImageWithUrlString:(NSString *)urlString imagePath:(NSString *)imagePath;

#pragma 获取网络存储的本地网络图片
+ (UIImage *)readUrlImageWithImagePath:(NSString *)imagePath;

#pragma 删除网络图片
+ (void)removeUrlImageWithImagePath:(NSString *)imagePath;

#pragma 保存单张图片  // /Documents/test.png
-(void)saveImageDocuments:(UIImage *)image path:(NSString *)path;

#pragma 获取单张图片
-(UIImage *)getDocumentImageWithImgName:(NSString *)path;

/**
 保存多张图片

 @param images 图片数组
 @return yes 成功
 */
- (BOOL)saveImages:(NSArray <UIImage *>*)images;

/**
 获取多张图片base64字符串数组

 @return 成功返回数组，失败返回nil
 */
- (NSArray *)getImagesBase64EncodingString;

@end
