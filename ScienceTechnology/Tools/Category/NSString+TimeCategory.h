//
//  NSString+TimeCategory.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TimeCategory)


/**
 时间对比

 @param currentDay 需要对比时间
 @param BaseDay 时间
 @param format 格式
 @return currentDay 对比 BaseDay 0:相同 1:大于 -1:小于
 */
+ (int)compareOneDay:(NSDate *)currentDay withAnotherDay:(NSDate *)BaseDay format:(NSString *)format;


/**
 获取当前时间

 @param format 格式
 @return 当前时间
 */
+ (NSDate *)getCurrentTimeWithFormat:(NSString *)format;

/**
 时间转换成字符串

 @param date 时间
 @param format 格式
 @return 当前时间
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format;

/**
 根据字符串获取时间

 @param dateStr 时间字符串
 @param format 格式
 @return 时间
 */
+ (NSDate *)getDateWithString:(NSString *)dateStr format:(NSString *)format;

//时间戳转时间字符串
- (NSString *)getTimeFromTimestampByformat:(NSString *)format;

//时间转时间戳
+ (NSString *)getTimeStampByDate:(NSDate *)date;

//时间字符串转时间戳
+ (NSString *)getTimeStampByDateStr:(NSString *)dateStr withFormat:(NSString *)format;

/// 获取年龄
/// @param bornDate 时间
+ (NSString *)dateToOld:(NSDate *)bornDate;

/// 获取星座
/// @param m 月
/// @param d 日
+(NSString *)getAstroWithMonth:(int)m day:(int)d;


/// 更改时间格式
/// @param timeString 时间字符串 @"yyyy/MM/dd HH:mm:ss:SSS"
/// @param format format
+ (NSString *)resetTime:(NSString *)timeString format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
