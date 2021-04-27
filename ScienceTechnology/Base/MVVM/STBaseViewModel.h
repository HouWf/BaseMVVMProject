//
//  STBaseViewModel.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STBaseViewModel : NSObject

@property (nonatomic, strong) RACReplaySubject *bridgeSubject;

@end

NS_ASSUME_NONNULL_END
