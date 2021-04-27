//
//  AlertView.h
//  JingJing
//
//  Created by hzhy001 on 2017/11/6.
//  Copyright © 2017年 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^ complateBlock)(NSInteger index);

typedef void (^ completeTextFieldBlock)(NSInteger index,NSString * _Nonnull textFieldText);

@interface AlertView : NSObject

@property (nonatomic, strong) UIAlertController *showVC;

+ (instancetype)shareAlertView;

/**
 一般Alert
 
 @param title 标题
 @param message  显示信息
 @param target 显示对象
 @param indexBlock 点击控制返回 1：确定 无：取消
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message target:(UIViewController * _Nullable)target block:(complateBlock )indexBlock;


/**
 
 @param title 标题
 @param message  显示信息
 @param target 显示对象
 @param indexBlock 点击控制返回 1：自定义 无：取消
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message okActionTitle:(NSString *)okActionTitle target:(UIViewController *)target block:(complateBlock)indexBlock;

/**
 单独按钮“确定”alert
 
 @param title 标题
 @param message 显示信息
 @param target 显示对象
 @param indexBlock 点击返回
 */
- (void)showAlertViewWithOneIndex:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actTitle target:(UIViewController *)target block:(complateBlock)indexBlock;

/**
 确定、取消alert
 
 @param title 标题
 @param message 显示信息
 @param cancel 取消名称
 @param otherTitle 确定名称
 @param target 显示对象
 @param indexBlock 点击返回
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString*)cancel otherTitle:(NSString *)otherTitle  target:(UIViewController *)target block:(complateBlock)indexBlock;

/**
 actionSheet
 
 @param title 标题
 @param message 信息
 @param cancel 取消
 @param otherTitles 其他按钮
 @param target 显示对象
 @param indexBlock 点击返回
 */
- (void)showActionSheetAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString*)cancel otherTitles:(NSArray *)otherTitles  target:(UIViewController *)target block:(complateBlock)indexBlock;

/**
 textField提示
 
 @param title 标题
 @param message 信息
 @param cancel 取消
 @param otherTitle 其他按钮名称
 @param target 显示对象
 @param textFieldBlock 点击返回
 */
- (void)showTextFieldAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString*)cancel otherTitle:(NSString *)otherTitle placeholder:(NSString *)placeholder target:(UIViewController *)target block:(completeTextFieldBlock)textFieldBlock;

- (void)dismissAlert;


@end
NS_ASSUME_NONNULL_END
