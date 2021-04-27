//
//  UIViewController+Category.m
//  BFCompetition
//
//  Created by hzhy001 on 2020/7/17.
//  Copyright © 2020 hzhy001. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>
#import "NSObject+ExchangeM.h"

@implementation UIViewController (Category)

+ (void)load{
    // enter
//    Method method1 = class_getInstanceMethod(self.class, @selector(viewWillAppear:));
//    Method method2 = class_getInstanceMethod(self.class, @selector(mobViewWillApper:));
//
//    BOOL didAddMethod =
//    class_addMethod(self.class,
//                    @selector(viewWillAppear:),
//                    method_getImplementation(method2),
//                    method_getTypeEncoding(method2));
//
//    if (didAddMethod) {
//        class_replaceMethod(self.class,
//                            @selector(mobViewWillApper:),
//                            method_getImplementation(method1),
//                            method_getTypeEncoding(method1));
//    } else {
//        method_exchangeImplementations(method1, method2);
//    }
    
    [self swizzleMethod:@selector(viewWillAppear:) swizzledSelector:@selector(mobViewWillApper:)];
    [self swizzleMethod:@selector(viewWillDisappear:) swizzledSelector:@selector(mobviewWillDisappear:)];

}

- (void)mobViewWillApper:(BOOL)animated{
//    NSString *className = NSStringFromClass(self.class);
    
}

- (void)mobviewWillDisappear:(BOOL)animated{

}



- (void)setGroupPicture:(NSString *)groupPicture{
    objc_setAssociatedObject(self, @selector(groupPicture), groupPicture, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)groupPicture{
    return objc_getAssociatedObject(self, @selector(groupPicture));
}

- (void)setGroupDes:(NSString *)groupDes{
    objc_setAssociatedObject(self, @selector(groupDes), groupDes, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)groupDes{
    return objc_getAssociatedObject(self, @selector(groupDes));
}

@end
