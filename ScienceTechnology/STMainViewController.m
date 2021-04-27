//
//  STMainViewController.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STMainViewController.h"
#import "STBaseViewController.h"

@interface STMainViewController ()<AxcAE_TabBarDelegate>

@end

@implementation STMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

#if 0
    CGRect rect = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
#endif
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, Main_Screen_Width, 0.5)];
    view.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [[UITabBar appearance] insertSubview:view atIndex:0];
    
    [self addChildControllers];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.axcTabBar.frame = self.tabBar.bounds;
    [self.axcTabBar viewDidLayoutItems];
}

- (void)addChildControllers{
    
    NSArray <NSDictionary *>*vcArray = @[
        @{
            @"itemTitle":@"首页",
            @"selectIcon":@"tab_home_icon_sel",
            @"normalIcon":@"tab_home_icon",
            @"vc":@"HomeViewController"
        },
        @{
            @"itemTitle":@"消息",
            @"selectIcon":@"tab_msg_icon_sel",
            @"normalIcon":@"tab_msg_icon",
            @"vc":@"STMessageViewController"
        },
        @{
            @"itemTitle":@"我的",
            @"selectIcon":@"tab_mine_icon_sel",
            @"normalIcon":@"tab_mine_icon",
            @"vc":@"STMineViewController"
        }
    ];
    
    NSMutableArray *tabBarConfs = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray *tabBarVCs = [NSMutableArray arrayWithCapacity:4];
    for (NSDictionary *dic in vcArray) {
        
        AxcAE_TabBarConfigModel *configModel = [[AxcAE_TabBarConfigModel alloc] init];
        configModel.itemTitle = dic[@"itemTitle"];
        configModel.selectColor = [UIColor colorWithHexString:@"#233140"];
        configModel.normalColor = [UIColor colorWithHexString:@"#8A9199"];
        configModel.selectImageName = dic[@"selectIcon"];
        configModel.normalImageName = dic[@"normalIcon"];
        configModel.titleLabel.font = DEFAULTFONT(10);
        configModel.interactionEffectStyle = AxcAE_TabBarInteractionEffectStyleSpring;
        configModel.normalBackgroundColor = [UIColor clearColor];
        configModel.pictureWordsMargin = -1.0;
        [tabBarConfs addObject:configModel];
        
        STBaseViewController *vc = [[NSClassFromString(dic[@"vc"]) alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.title = dic[@"itemTitle"];
        vc.view.backgroundColor = UIColor.whiteColor;
//        vc.tabBarItem.title =dic[@"itemTitle"];
//        vc.tabBarItem.image =GetImage(dic[@"normalIcon"]) ;
//        vc.tabBarItem.selectedImage = GetImage(dic[@"selectIcon"]) ;
        [tabBarVCs addObject:nav];
    }
    
    self.viewControllers = tabBarVCs;
    
    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    self.axcTabBar.translucent = YES;
    self.axcTabBar.delegate = self;
    [self.tabBar addSubview:self.axcTabBar];

}

#pragma mark - AxcAE_TabBarDelegate
- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
    [self setSelectedIndex:index];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.axcTabBar){
        self.axcTabBar.selectIndex = selectedIndex;
    }
}

@end
