//
//  STBaseTableViewController.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface STBaseTableViewController : STBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
