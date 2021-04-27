//
//  DCObjManager.m
//  CDDKit
//
//  Created by apple on 2017/10/8.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCObjManager.h"

@implementation DCObjManager

#pragma mark - 把对象归档存到沙盒里
+ (void)dc_saveObject:(id)object byFileName:(NSString*)fileName
{
    NSString *path  = [self appendFilePath:fileName];
    
    [NSKeyedArchiver archiveRootObject:object toFile:path];
    
}

#pragma mark - 通过文件名从沙盒中找到归档的对象
+ (id)dc_getObjectByFileName:(NSString*)fileName
{
    
    NSString *path  = [self appendFilePath:fileName];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

#pragma mark - 根据文件名删除沙盒中的 plist 文件
+ (void)dc_removeFileByFileName:(NSString*)fileName
{
    NSString *path  = [self appendFilePath:fileName];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

#pragma mark - 拼接文件路径
+ (NSString*)appendFilePath:(NSString*)fileName
{
    
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *file = [NSString stringWithFormat:@"%@/%@.archiver",documentsPath,fileName];
    
    return file;
}

#pragma mark - NSUserDefults
+ (void)dc_saveUserData:(id)data forKey:(NSString*)key
{
    if (data)
    {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

#pragma mark - 读取用户偏好设置
+ (id)dc_readUserDataForKey:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
    
}

#pragma mark - 删除用户偏好设置
+ (void)dc_removeUserDataForkey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

//保存图片
+ (void)saveUrlImageWithUrlString:(NSString *)urlString imagePath:(NSString *)imagePath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *picName = [NSString stringWithFormat:@"%@.png",imagePath];
    NSString *imageFilePath = [path stringByAppendingPathComponent:picName];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
    UIImage * currentImage = [UIImage imageWithData:data];
    [UIImageJPEGRepresentation(currentImage, 0.5) writeToFile:imageFilePath  atomically:YES];
}

+ (UIImage *)readUrlImageWithImagePath:(NSString *)imagePath{
    // 读取沙盒路径图片
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *picName = [NSString stringWithFormat:@"%@.png",imagePath];
    NSString *imageFilePath = [path stringByAppendingPathComponent:picName];
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:imageFilePath];
    if (imageFilePath.length == 0 || imageFilePath == nil) {
        NSLog(@"获取路径失败");
        return nil;
    }
    return imgFromUrl3;
}

+ (void)removeUrlImageWithImagePath:(NSString *)imagePath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *picName = [NSString stringWithFormat:@"%@.png",imagePath];
    NSString *imageFilePath = [path stringByAppendingPathComponent:picName];
    [[NSFileManager defaultManager] removeItemAtPath:imageFilePath error:nil];
}

-(void)saveImageDocuments:(UIImage *)image path:(NSString *)path{
    
    //拿到图片
    UIImage *imagesave = image;
    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:path];// @"/Documents/test.png"
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
}

// 读取并存贮到相册

-(UIImage *)getDocumentImageWithImgName:(NSString *)path {
    // 读取沙盒路径图片
    NSString *path_sandox = NSHomeDirectory();
    NSString *aPath3=[NSString stringWithFormat:@"%@/%@",path_sandox,path];
    // 拿到沙盒路径图片
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:aPath3];
    // 图片保存相册
//    UIImageWriteToSavedPhotosAlbum(imgFromUrl3, self, nil, nil);
    return imgFromUrl3;
}

- (BOOL)saveImages:(NSArray <UIImage *>*)images{
    NSString *path = NSHomeDirectory();
    NSString *newPath = [path stringByAppendingPathComponent:@"/Documents/pic.plist"];
    NSMutableArray *arra = [NSMutableArray array];
    for (UIImage *img in images) {
        NSData *data = UIImageJPEGRepresentation(img, 0.4f);
        NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [arra addObject:strimage64];
    }
    if ([arra writeToFile:newPath atomically:YES]) {
        return YES;
    }
    return NO;
}

- (NSArray *)getImagesBase64EncodingString{
    NSString *path = NSHomeDirectory();
    NSString *arrayPath = [path stringByAppendingPathComponent:@"/Documents/pic.plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:arrayPath];
    if (arr.count!=0) {
        return arr;
    }
    return nil;
}

@end
