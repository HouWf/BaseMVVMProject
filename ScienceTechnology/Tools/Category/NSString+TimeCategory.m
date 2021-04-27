//
//  NSString+TimeCategory.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "NSString+TimeCategory.h"

@implementation NSString (TimeCategory)

//日期对比
+ (int)compareOneDay:(NSDate *)currentDay withAnotherDay:(NSDate *)BaseDay format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *currentDayStr = [dateFormatter stringFromDate:currentDay];
    NSString *BaseDayStr = [dateFormatter stringFromDate:BaseDay];
    NSDate *dateA = [dateFormatter dateFromString:currentDayStr];
    NSDate *dateB = [dateFormatter dateFromString:BaseDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", currentDay, BaseDay);
    if (result == NSOrderedDescending) {
        return 1;
    }
    else if (result == NSOrderedAscending){
        return -1;
    }
    return 0;
}

+ (NSDate *)getCurrentTimeWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    return date;
}

+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

+ (NSDate *)getDateWithString:(NSString *)dateStr format:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate *dat = [formatter dateFromString:dateStr];
    return dat;
}

- (NSString *)getTimeFromTimestampByformat:(NSString *)format{

    //将对象类型的时间转换为NSDate类
    NSTimeInterval interval = [self doubleValue] / 1000.0;
    NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:interval];
    //设置时间格式
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    //将时间转换为字符串
    NSString *timeStr=[formatter stringFromDate:myDate];
    return timeStr;
}

//时间转时间戳
+ (NSString *)getTimeStampByDate:(NSDate *)date
{
    double recordTime = (double)[date timeIntervalSince1970];
    NSString *timeLocal = [NSString stringWithFormat:@"%.f",recordTime];
    return timeLocal;
}

//时间字符串转时间戳
+ (NSString *)getTimeStampByDateStr:(NSString *)dateStr withFormat:(NSString *)format{
    NSDate *dat = [self getDateWithString:dateStr format:format];
    NSString *timeStamp = [self getTimeStampByDate:dat];
    if ([format containsString:@"SSS"]) {
        timeStamp = [timeStamp stringByAppendingString:@"000"];
    }
    return timeStamp;
}

+ (NSString *)dateToOld:(NSDate *)bornDate{
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //获得当前系统时间与出生日期之间的时间间隔
    NSTimeInterval time = [currentDate timeIntervalSinceDate:bornDate];
    //时间间隔以秒作为单位,求年的话除以60*60*24*356
    int age = ((int)time)/(3600*24*365);
    return [NSString stringWithFormat:@"%d",age];
}

+(NSString *)getAstroWithMonth:(int)m day:(int)d{
    
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    if (m<1||m>12||d<1||d>31){
        
        return @"日期格式有误";
    }
    if(m==2 && d>29){
        return @"错误日期格式!!";
    }
    else if(m==4 || m==6 || m==9 || m==11) {
    
        if (d>30) {
            return @"错误日期格式!!!";
            
        }
        
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    
    return result;
    
}


+ (NSString *)resetTime:(NSString *)timeString format:(NSString *)format{
    NSString *timeStr = [timeString getTimeFromTimestampByformat:DEFAULT_SLASH_SSS_DATE_FORMAT];
    NSDate *newDate = [NSString getDateWithString:timeStr format:DEFAULT_SLASH_SSS_DATE_FORMAT];
    NSString *newStr = [NSString getDateStringWithDate:newDate format:format];
    return newStr;
}

@end
