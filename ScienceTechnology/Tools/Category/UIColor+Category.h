//
//  UIColor+Category.h
//  51XiaoNiu
//
//  Created by 乔同新 on 16/5/24.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;

// Other
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
