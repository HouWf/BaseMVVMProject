//
//  UILabel+Category.m
//  BFCompetition
//
//  Created by hzhy001 on 2020/3/9.
//  Copyright © 2020 hzhy001. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)labelWithTextColor:(UIColor *)color
                       textFont:(UIFont *)font
                   textAligment:(NSTextAlignment)alignment
                  numberOfLines:(NSInteger)numberOfLines{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = alignment;
    label.font = font;
    label.textColor = color;
    label.numberOfLines = numberOfLines;
    return label;
    
}

@end
