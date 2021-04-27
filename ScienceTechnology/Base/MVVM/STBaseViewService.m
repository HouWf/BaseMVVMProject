//
//  STBaseViewService.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseViewService.h"

@implementation STBaseViewService

- (instancetype)initWithViewModel:(STBaseViewModel *)viewModel viewController:(STBaseViewController * _Nullable)viewController{
    if (self = [super init]) {
        self.viewModel = viewModel;
        self.viewController = viewController;
        [self setupLayout];
    }
    return self;
}

+ (instancetype)initWithViewModel:(STBaseViewModel *)viewModel{
    return [[self alloc] initWithViewModel:viewModel viewController:nil];
}

+ (instancetype)initWithViewModel:(STBaseViewModel *)viewModel viewController:(STBaseViewController *)viewController{
    return [[self alloc] initWithViewModel:viewModel viewController:viewController];
}

- (void)setupLayout{
    
}

@end
