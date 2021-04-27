//
//  STUserInfoModel.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STUserInfoModel.h"

@implementation STUserInfoModel


/**
 *  归档保存用户数据
 */
-(void)saveUserInfo{
    [DCObjManager dc_saveUserData:@(1) forKey:USERDEFAULT_KEY_IFLOGIN];
    [DCObjManager dc_saveObject:self byFileName:@"userInfo"];
    
//    NSString *path =  [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/info.plist"];
//    NSMutableData *archiveData = [[NSMutableData alloc] init];
//    NSKeyedArchiver *keyArchive = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiveData];
//    [keyArchive encodeObject:self forKey:@"encodeObject"];
//    [keyArchive finishEncoding];
//    [archiveData writeToFile:path atomically:YES];
    
    /*
     NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop/bag.data"];
     // Encoding
     [NSKeyedArchiver archiveRootObject:self toFile:file];
     */
}

-(void)removeUserInfo
{
    [DCObjManager dc_saveUserData:@(0) forKey:USERDEFAULT_KEY_IFLOGIN];
    [DCObjManager dc_removeFileByFileName:@"userInfo"];
    
//
//    NSString *path =  [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/info.plist"];
//    NSFileManager * fileManager = [[NSFileManager alloc]init];
//    if ([fileManager fileExistsAtPath:path]) {
//        [fileManager removeItemAtPath:path error:nil];
//    }
}

/**
 *  归档读取用户数据
 *
 *  @return 用户的数据模型
 */
+ (instancetype)readUserInfo{
    
    return [DCObjManager dc_getObjectByFileName:@"userInfo"];
    
//    NSString *path =  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/info.plist"];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:path]) {
//        NSData *aDcoderData = [NSData dataWithContentsOfFile:path];
//        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:aDcoderData];
//        BFCLoginModel *codeing = [unarchiver decodeObjectForKey:@"encodeObject"];
//        [unarchiver finishDecoding];
//        return codeing;
//    }
//    else
//        return nil;
    
    /*
     TALoginModel *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
     return decodedBag;
     */
}

MJCodingImplementation;

@end
