//
//  STLoginViewController.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STLoginViewController.h"
#import "STLoginViewService.h"
#import "HomeViewController.h"

@interface STLoginViewController ()

@property (nonatomic, strong) STLoginViewService *viewService;

@property (nonatomic, strong) STLoginViewModel *viewModel;

@end

@implementation STLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fullScreenPresentationStyle = YES;
    
    self.viewModel = [[STLoginViewModel alloc] init];
    self.viewService = [STLoginViewService initWithViewModel:self.viewModel viewController:nil];
    self.view = self.viewService;
    
    [self.viewModel.bridgeSubject subscribeNext:^(id  _Nullable x) {
        SEL sel = NSSelectorFromString(x);
        if ([self canRunToSelector:sel]) {
            [self runSuperSelector:sel withObjects:nil];
        }
    }];
}

- (void)loadMainCtr {
    [self presentViewController:[[NSClassFromString(@"STMainViewController") alloc] init] animated:YES completion:nil];
}

@end
