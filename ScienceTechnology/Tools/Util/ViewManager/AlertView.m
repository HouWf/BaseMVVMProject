//
//  AlertView.m
//  JingJing
//
//  Created by hzhy001 on 2017/11/6.
//  Copyright © 2017年 hzhy001. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

+ (instancetype)shareAlertView{
    static AlertView *alertView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertView = [[AlertView alloc] init];
    });
    return alertView;
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message target:(UIViewController * _Nullable)target block:(complateBlock)indexBlock{
    if (target == nil) {
        target = [[STAppDelegateConfig sharedManager] getCurrentViewController];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        NSMutableAttributedString *attMessage = [[NSMutableAttributedString alloc] initWithString:message];
        [attMessage addAttribute:NSForegroundColorAttributeName value:RGBA(112, 112, 112, 1) range:NSMakeRange(0, attMessage.length)];
        [attMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attMessage.length)];
        [alertController setValue:attMessage forKey:@"attributedMessage"];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (indexBlock) {
                indexBlock(0);
            }
        }];
        [cancelAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (indexBlock) {
                indexBlock(1);
            }
        }];
        self.showVC = alertController;
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [target presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message okActionTitle:(NSString *)okActionTitle target:(UIViewController *)target block:(complateBlock)indexBlock{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        NSMutableAttributedString *attMessage = [[NSMutableAttributedString alloc] initWithString:message];
        [attMessage addAttribute:NSForegroundColorAttributeName value:RGBA(112, 112, 112, 1) range:NSMakeRange(0, attMessage.length)];
        [attMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attMessage.length)];
        [alertController setValue:attMessage forKey:@"attributedMessage"];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (indexBlock) {
                indexBlock(0);
            }
        }];
        [cancelAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (indexBlock) {
                indexBlock(1);
            }
        }];
        self.showVC = alertController;
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [target presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)showAlertViewWithOneIndex:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actTitle target:(UIViewController *)target block:(complateBlock)indexBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:actTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (indexBlock) {
            indexBlock(0);
        }
    }];
    self.showVC = alertController;
    [alertController addAction:cancelAction];
    [target presentViewController:alertController animated:YES completion:nil];
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString*)cancel otherTitle:(NSString *)otherTitle target:(UIViewController *)target block:(complateBlock)indexBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *attMessage = [[NSMutableAttributedString alloc] initWithString:message];
    [attMessage addAttribute:NSForegroundColorAttributeName value:RGBA(112, 112, 112, 1) range:NSMakeRange(0, attMessage.length)];
    [attMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attMessage.length)];
    [alertController setValue:attMessage forKey:@"attributedMessage"];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (indexBlock) {
            indexBlock(0);
        }
    }];
    [self changeActionStyle:cancelAction title:cancel];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (indexBlock) {
            indexBlock(1);
        }
    }];
    [self changeActionStyle:okAction title:otherTitle];

    self.showVC = alertController;
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [target presentViewController:alertController animated:YES completion:nil];
}

- (void)showActionSheetAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString*)cancel otherTitles:(NSArray *)otherTitles  target:(UIViewController *)target block:(complateBlock)indexBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:nil];
    [cancelAction setValue:RGBA(230, 69, 69, 1) forKey:@"titleTextColor"];
    [alertController addAction:cancelAction];
    if (otherTitles.count != 0) {
        for (NSInteger i = 0 ; i < otherTitles.count; i ++) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (indexBlock) {
                    indexBlock(i);
                }
            }];
            [alertController addAction:otherAction];
        }
    }
    
    self.showVC = alertController;
    [target presentViewController:alertController animated:YES completion:nil];
}

- (void)showTextFieldAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString*)cancel otherTitle:(NSString *)otherTitle placeholder:(NSString *)placeholder target:(UIViewController *)target block:(completeTextFieldBlock)textFieldBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (textFieldBlock) {
            textFieldBlock(0,@"");
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (textFieldBlock) {
            textFieldBlock(1,[[alert.textFields lastObject] text]);
        }
    }]];
    
    self.showVC = alert;
    [target presentViewController:alert animated:YES completion:NULL];
}

- (void)dismissAlert{
    [self.showVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeActionStyle:(UIAlertAction *)action title:(NSString *)title{
    if ([title isEqualToString:@"确定"] ||
        [title isEqualToString:@"去逛逛"] ||
        [title isEqualToString:@"申请入驻"] ||
        [title isEqualToString:@"继续编辑"] ||
        [title isEqualToString:@"呼叫"] ||
        [title isEqualToString:@"换绑"] ||
        [title isEqualToString:@"确认已充值"] ||
        [title isEqualToString:@"设置"]) {
        [action setValue:RGBA(0, 122, 253, 1) forKey:@"titleTextColor"];
    }
    else
    {
        [action setValue:UIColor.blackColor forKey:@"titleTextColor"];
    }
}

@end
