//
//  STBaseViewService.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "STBaseViewModel.h"
#import "STBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface STBaseViewService : UIView

+ (instancetype)initWithViewModel:(STBaseViewModel *)viewModel;

+ (instancetype)initWithViewModel:(STBaseViewModel *)viewModel
                   viewController:(STBaseViewController * _Nullable)viewController;

@property (nonatomic, strong) STBaseViewController *viewController;

@property (nonatomic, strong) STBaseViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
