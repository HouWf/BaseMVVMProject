//
//  STMacro.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#ifndef STMacro_h
#define STMacro_h

// 是否是测试环境，同为0时为发布环境
#define IF_DEV 1
// 预发布地址
#define IF_REPUB 0

/****************** 时间format ****************/
#define DEFAULT_SLASH_DATE_FORMAT       @"yyyy/MM/dd"
#define DEFAULT_SLASH_MM_DATE_FORMAT    @"yyyy/MM/dd HH:mm"
#define DEFAULT_SLASH_SS_DATE_FORMAT    @"yyyy/MM/dd HH:mm:ss"
#define DEFAULT_SLASH_SSS_DATE_FORMAT   @"yyyy/MM/dd HH:mm:ss:SSS"

#define DEFAULT_LINE_DATE_FORMAT        @"yyyy-MM-dd"
#define DEFAULT_LINE_MM_DATE_FORMAT     @"yyyy-MM-dd HH:mm"
#define DEFAULT_LINE_SS_DATE_FORMAT     @"yyyy-MM-dd HH:mm:ss"
#define DEFAULT_LINE_SSS_DATE_FORMAT    @"yyyy-MM-dd HH:mm:ss:SSS"

#define DEFAULT_CH_MM_DATE_FORMAT    @"MM月dd日 HH:mm"


/****************** 尺寸 ****************/
//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (Main_Screen_Width / 414.0)
#define kScreenHeightRatio (Main_Screen_Height / 896.0)
#define AdaptedWidth(x)  (x * kScreenWidthRatio)
#define AdaptedHeight(x) (x * kScreenHeightRatio)

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width


/****************** 单例 ****************/
// @interface
#define singleton_interface(className) \
+ (className *)sharedManager;

// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)sharedManager \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}


/****************** 字体 ****************/
// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)    [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)        [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)        [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define DEFAULTFONT(FONTSIZE)       FONT(@"PingFangSC-Regular", FONTSIZE)
#define DEFAULTFONT_BOLD(FONTSIZE)  FONT(@"PingFangSC-Medium", FONTSIZE)
#define DEFAULTFONT_HN(FONTSIZE)    FONT(@"HelveticaNeue", FONTSIZE)
#define DEFAULTFONT_HN_BOLD(FONTSIZE)    FONT(@"HelveticaNeue-Bold", FONTSIZE)


/****************** 导航 ****************/
// 显示线条
#define ShowNavigationBottomLine \
[self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];\
[self.navigationController.navigationBar setShadowImage:nil];

// 隐藏线条
#define HiddenNavigationBottomLine \
[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];\
[self.navigationController.navigationBar setShadowImage:[UIImage new]];


/****************** 颜色 ****************/
#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000
#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


/****************** 图片选择 ****************/
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


/****************** 设备管理 ****************/
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列  6
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列 7
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列  5
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列 4
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX  3
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr 2
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs 3
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max 1
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//iPhoneX系列
#define k_Height_NavContentBar 44.0f
#define k_Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define k_Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define k_Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define k_Height_CancelBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 34 : 0)

#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };
#define WEAK  @weakify(self);
#define STRONG  @strongify(self);

#endif /* STMacro_h */
