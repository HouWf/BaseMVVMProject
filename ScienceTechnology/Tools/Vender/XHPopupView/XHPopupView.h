//
//  XHPopupView.h
//  XHPopupView
//
//  Created by icochu on 2019/10/15.
//  Copyright © 2019 Sniper. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XHPopupShowType) {
    XHPopupShowType_None,              //没有
    XHPopupShowType_FadeIn,            //淡入
    XHPopupShowType_GrowIn,            //成长
    XHPopupShowType_ShrinkIn,           //收缩
    XHPopupShowType_SlideInFromTop,     //从顶部，底部，左侧，右侧滑入
    XHPopupShowType_SlideInFromBottom,
    XHPopupShowType_SlideInFromLeft,
    XHPopupShowType_SlideInFromRight,
    XHPopupShowType_BounceIn,           //从顶部，底部，左侧，右侧，中心弹跳
    XHPopupShowType_BounceInFromTop,
    XHPopupShowType_BounceInFromBottom,
    XHPopupShowType_BounceInFromLeft,
    XHPopupShowType_BounceInFromRight
};

typedef NS_ENUM(NSUInteger, XHPopupDismissType) {
    XHPopupDismissType_None,
    XHPopupDismissType_FadeOut,
    XHPopupDismissType_GrowOut,
    XHPopupDismissType_ShrinkOut,
    XHPopupDismissType_SlideOutToTop,
    XHPopupDismissType_SlideOutToBottom,
    XHPopupDismissType_SlideOutToLeft,
    XHPopupDismissType_SlideOutToRight,
    XHPopupDismissType_BounceOut,
    XHPopupDismissType_BounceOutToTop,
    XHPopupDismissType_BounceOutToBottom,
    XHPopupDismissType_BounceOutToLeft,
    XHPopupDismissType_BounceOutToRight
};

//在水平方向上布置弹出窗口
typedef NS_ENUM(NSUInteger, XHPopupHorizontalLayout) {
    XHPopupHorizontalLayout_Custom,
    XHPopupHorizontalLayout_Left,
    XHPopupHorizontalLayout_LeftOfCenter,           //中心左侧
    XHPopupHorizontalLayout_Center,
    XHPopupHorizontalLayout_RightOfCenter,
    XHPopupHoricontalLayout_Right
};
//在垂直方向上布置弹出窗口
typedef NS_ENUM(NSUInteger, XHPopupVerticalLayout) {
    XHPopupVerticalLayout_Custom,
    XHPopupVerticalLayout_Top,
    XHPopupVerticalLayout_AboveCenter,              //中心偏上
    XHPopupVerticalLayout_Center,
    XHPopupVerticalLayout_BelowCenter,
    XHPopupVerticalLayout_Bottom
};

typedef NS_ENUM(NSUInteger, XHPopupMaskType) {
    //允许与底层视图交互
    XHPopupMaskType_None,
    //不允许与底层视图交互。
    XHPopupMaskType_Clear,
    //不允许与底层视图、背景进行交互。
    XHPopupMaskType_Dimmed
};

struct XHPopupLayout {
    XHPopupHorizontalLayout horizontal;
    XHPopupVerticalLayout vertical;
};

typedef struct XHPopupLayout XHPopupLayout;

extern XHPopupLayout XHPopupLayoutMake(XHPopupHorizontalLayout horizontal, XHPopupVerticalLayout vertical);

extern const XHPopupLayout XHPopupLayout_Center;
NS_ASSUME_NONNULL_BEGIN

@interface XHPopupView : UIView

//自定义视图
@property (nonatomic, strong) UIView *contentView;
//弹出动画
@property (nonatomic, assign) XHPopupShowType showType;
//消失动画
@property (nonatomic, assign) XHPopupDismissType dismissType;
//交互类型
@property (nonatomic, assign) XHPopupMaskType maskType;
//默认透明的0.5，通过这个属性可以调节 XHPopupMaskType_Dimmed结合使用
@property (nonatomic, assign) CGFloat dimmedMaskAlpha;
//提示透明度
@property (nonatomic, assign) CGFloat toastMaskAlpha;
//动画出现时间默认0.15
@property (nonatomic, assign) CGFloat showInDuration;
//动画消失时间默认0.15
@property (nonatomic, assign) CGFloat dismissOutDuration;
//当背景被触摸时，弹出窗口会消失。
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundTouch;
//当内容视图被触摸时，弹出窗口会消失默认no
@property (nonatomic, assign) BOOL shouldDismissOnContentTouch;
//显示动画启动时回调。
@property (nonatomic, copy, nullable) void(^willStartShowingBlock)(void);
//显示动画完成启动时回调。
@property (nonatomic, copy, nullable) void(^didFinishShowingBlock)(void);
//显示动画将消失时回调。
@property (nonatomic, copy, nullable) void(^willStartDismissingBlock)(void);
//显示动画已经消失时回调。
@property (nonatomic, copy, nullable) void(^didFinishDismissingBlock)(void);
//背景视图
@property (nonatomic, strong, readonly) UIView *backgroundView;
//展现内容视图
@property (nonatomic, strong, readonly) UIView *containerView;
//是否开始展现
@property (nonatomic, assign, readonly) BOOL isBeingShown;
//正在展现
@property (nonatomic, assign, readonly) BOOL isShowing;
//开始消失
@property (nonatomic, assign, readonly) BOOL isBeingDismissed;
/**
 弹出一个自定义视图
 */
+ (XHPopupView *)popupWithContentView:(UIView *)contentView;

//弹出提示框
+ (void)showToastVieWiththContent:(NSString *)content;

//弹出自定义文字提示框
+ (void)showToastVieWithAttributedContent:(NSAttributedString *)attributedString;


/**
 弹出自定义文字提示框
 @param content 提示文字
 @param showType 出现动画
 @param dismissType 消失动画
 @param time 停留时间，默认2秒
 */
+ (void)showToastVieWiththContent:(NSString *)content
                         showType:(XHPopupShowType)showType
                      dismissType:(XHPopupDismissType)dismissType
                         stopTime:(NSInteger)time;

//弹出自定义文字提示框
+ (void)showToastViewWithAttributedContent:(NSAttributedString *)attributedString
                                  showType:(XHPopupShowType)showType
                               dismissType:(XHPopupDismissType)dismissType
                                  stopTime:(NSInteger)time;
/**
 弹出一个自定义视图
 @param contentView 自定义视图
 @param showType 弹出动画
 @param dismissType 消失动画
 @param maskType 交互类型
 @param shouldDismissOnBackgroundTouch 当背景被触摸时，弹出窗口会消失 默认yes
 @param shouldDismissOnContentTouch 当内容视图被触摸时，弹出窗口会消失默认no
 @return 返回视图
 */
+ (XHPopupView *)popupWithContentView:(UIView *)contentView
                             showType:(XHPopupShowType)showType
                          dismissType:(XHPopupDismissType)dismissType
                             maskType:(XHPopupMaskType)maskType
             dismissOnBackgroundTouch:(BOOL)shouldDismissOnBackgroundTouch
                dismissOnContentTouch:(BOOL)shouldDismissOnContentTouch;

+ (void)dismissAllPopups;

+ (void)dismissPopupForView:(UIView *)view animated:(BOOL)animated;

+ (void)dismissSuperPopupIn:(UIView *)view animated:(BOOL)animated;

- (void)show;

- (void)showWithLayout:(XHPopupLayout)layout;

- (void)showWithDuration:(NSTimeInterval)duration;

- (void)showWithLayout:(XHPopupLayout)layout duration:(NSTimeInterval)duration;

- (void)showAtCenterPoint:(CGPoint)point inView:(UIView *)view;

- (void)showAtCenterPoint:(CGPoint)point inView:(UIView *)view duration:(NSTimeInterval)duration;


/**
 取消所有提示
 @param animated 是否需要动画
 */
- (void)dismissAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
