//
//  STBaseViewModel.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STBaseViewModel.h"

@implementation STBaseViewModel

- (RACReplaySubject *)bridgeSubject{
    if (!_bridgeSubject) {
        _bridgeSubject = [[RACReplaySubject alloc] init];
    }
    return _bridgeSubject;
}

@end
