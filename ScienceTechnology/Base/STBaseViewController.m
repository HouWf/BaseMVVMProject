//
//  STBaseViewController.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseViewController.h"

@interface STBaseViewController ()

@end

@implementation STBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fullScreenPresentationStyle = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if (self.fullScreenPresentationStyle) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
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
