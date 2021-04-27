//
//  UILabel+Category.h
//  BFCompetition
//
//  Created by hzhy001 on 2020/3/9.
//  Copyright © 2020 hzhy001. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

+ (UILabel *)labelWithTextColor:(UIColor *)color
                       textFont:(UIFont *)font
                   textAligment:(NSTextAlignment)alignment
                  numberOfLines:(NSInteger)numberOfLines;

@end

NS_ASSUME_NONNULL_END
