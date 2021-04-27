//
//  STMineViewController.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/26.
//

#import "STMineViewController.h"

@interface STMineViewController ()

@end

@implementation STMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *loginOut = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginOut setTitle:@"退出登录" forState:UIControlStateNormal];
    [loginOut setBackgroundColor:UIColor.lightGrayColor];
    [loginOut setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    loginOut.titleLabel.font = DEFAULTFONT(14);
    loginOut.layer.cornerRadius = 5;
    loginOut.layer.masksToBounds = YES;
    loginOut.frame = CGRectMake(100, 100, 100, 50);
    [loginOut addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginOut];
    
}

- (void)logout{
    [[STAppDelegateConfig sharedManager] loginOut];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
