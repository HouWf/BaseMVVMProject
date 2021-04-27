//
//  NSString+Category.h
//  JingJing
//
//  Created by hzhy001 on 2017/11/9.
//  Copyright © 2017年 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//手机号分服务商
- (BOOL)isMobileNumberClassification;

//手机号有效性
- (BOOL)isMobileNumber;

// 是否是我们的二维码
- (BOOL)isOurCode;

//邮箱
- (BOOL)isEmailAddress;

//身份证号
- (BOOL) simpleVerifyIdentityCardNum;

//车牌
- (BOOL)isCarNumber;

//MAC地址
- (BOOL)isMacAddress;

//url地址可用
- (BOOL)isValidUrl;

// 中文
- (BOOL)isValidChinese;

//邮编
- (BOOL)isValidPostalcode;

// 车牌号
- (BOOL)isValidTaxNo;

//精确的身份证号码有效性检测
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

//银行卡号有效性问题Luhn算法
- (BOOL)bankCardluhmCheck;

// IP地址
- (BOOL)isIPAddress;

//???
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 判断是否包含表情
 
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

#pragma mark - 获取文字size
-(CGSize) sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

//类方法
+(CGSize) sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;

//图片转字符串
+ (NSString *)UIImageToBase64Str:(UIImage *) image;

//字符串转图片
+ (UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;

// md5加密
+ (NSString *) md5:(NSString *) str;

// 编辑富文本 左图片11*11+右文字
+ (NSMutableAttributedString *)attributedStringWithText:(NSString *)text imageNamed:(NSString *)imageName size:(CGSize)size;

//分段改变字体的颜色
+ (NSMutableAttributedString *)changeString:(NSString *)string ranges:(NSArray *)ranges attributes:(NSDictionary *)attributes;

/**
 改变字体颜色和尺寸
 
 @param formatStr 拼接前字符串
 @param changeStr 需要改变的字符串
 @param font font
 @param color color
 */
+ (NSMutableAttributedString *)atrributedStrWithFormatStr:(NSString *)formatStr changeStr:(NSString *)changeStr font:(UIFont *)font textColor:(UIColor *)color;
// 改变字体颜色和font
+ (NSMutableAttributedString *)attributedWitSourceStr:(NSString *)sourceStr attributeString:(NSString *)attStr font:(UIFont *)font textColor:(UIColor *)color;
/**
 加下划线
 */
+ (NSMutableAttributedString *)setSingleLineWithText:(NSString *)text textColor:(UIColor *)color;

/**
 设置行间距
 
 @param sourceString 字符串
 @param spacing 行间距
 */
+ (NSMutableAttributedString *)attributedWithSourcestring:(NSString *)sourceString lineSpacing:(CGFloat)spacing;

/**
 数字转中文
 */
-(NSString*)transChinese;

/*
 1~10
 ONE~TEN
 互转
 */
+ (NSString *)chineseAndEnglishTranslation:(NSString *)numStr;

/**
 NSString转化为NSMutableAttributedString 解决行间距问题
 
 @param string 文本
 @param font 文本字体大小
 @param lineSpace 文本行间距
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)stringToAttributedString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize LineSpace:(int)lineSpace;

+ (NSString *)uuidString;

//ios11 从通讯录复制手机号码 前后有特殊符号
+ (NSString *)getSeparatedPhoneNumberWithString:(NSString *)phoneString;


/**
*  判断字符串中是否存在emoji
* @param string 字符串
* @return YES(含有表情)
*/
+ (BOOL)hasEmoji:(NSString*)string;

/**
判断是不是九宫格
@param string  输入的字符
@return YES(是九宫格拼音键盘)
*/
+ (BOOL)isNineKeyBoard:(NSString *)string;


@end
