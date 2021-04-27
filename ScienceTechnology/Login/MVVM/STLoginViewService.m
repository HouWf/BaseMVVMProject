//
//  STLoginViewService.m
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#import "STLoginViewService.h"

@interface STLoginViewService()

@property (nonatomic, strong) UIImageView *back_img_view;

@property (nonatomic, strong) UILabel *title_label;

@property (nonatomic, strong) UILabel *name_label;

@property (nonatomic, strong) UILabel *pwd_label;

@property (nonatomic, strong) UITextField *user_name_textfield;

@property (nonatomic, strong) UITextField *user_pwd_textfield;

@property (nonatomic, strong) UIButton *submit_button;

@end

@implementation STLoginViewService

- (void)setupLayout{
    
    WEAK
    [self.back_img_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self_weak_);
    }];
    
    [self.title_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self_weak_);
        make.top.mas_offset(150);
        make.height.mas_equalTo(30);
    }];
    
    [self.name_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(50);
        make.top.equalTo(self_weak_.title_label).offset(100);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    
    [self.user_name_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self_weak_.name_label);
        make.left.equalTo(self_weak_.name_label.mas_right).offset(10);
        make.right.mas_offset(-50);
        make.height.mas_equalTo(40);
    }];
    
    [self.pwd_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.height.equalTo(self_weak_.name_label);
        make.top.equalTo(self_weak_.name_label.mas_bottom).offset(40);
    }];
    
    [self.user_pwd_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.height.equalTo(self_weak_.user_name_textfield);
        make.centerY.equalTo(self_weak_.pwd_label);
    }];
    
    [self.submit_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self_weak_.name_label.mas_left).offset(20);
        make.right.equalTo(self_weak_.user_pwd_textfield.mas_right).offset(-20);
        make.height.mas_equalTo(44);
        make.top.equalTo(self_weak_.user_pwd_textfield.mas_bottom).offset(50);
    }];
    
    [self loadAction];
}

- (void)loadAction {
    STLoginViewModel *vm =(STLoginViewModel *) self.viewModel;
    
    WEAK
    [[self.submit_button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        if (vm.user_name.length == 0) {
            [TostaObject showTosta:@"请输入用户名" hideAfterDelay:2];
            [self_weak_.user_name_textfield becomeFirstResponder];
        }
        else if (vm.user_pwd.length == 0) {
            [TostaObject showTosta:@"请输入密码" hideAfterDelay:2];
            [self_weak_.user_pwd_textfield becomeFirstResponder];
        }
        else{
            [[vm  signalForLogin] subscribeNext:^(id  _Nullable x) {
                STUserInfoModel *useInfo = [STUserInfoModel readUserInfo];
                NSLog(@"当前用户名：%@ ", useInfo.userName);
                [vm.bridgeSubject sendNext:Method_loadMainCtr];
            }];
        }
        
    }];
    
    [[self.user_name_textfield rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        vm.user_name = x;
    }];
    
    [[self.user_pwd_textfield rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        vm.user_pwd = x;
    }];
}

#pragma mark - lazy
- (UIImageView *)back_img_view{
    if (!_back_img_view) {
        _back_img_view = [[UIImageView alloc] init];
        _back_img_view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        [self addSubview:_back_img_view];
    }
    return _back_img_view;
}

- (UILabel *)title_label{
    if (!_title_label) {
        _title_label = [UILabel labelWithTextColor:UIColor.blackColor textFont:DEFAULTFONT_BOLD(20) textAligment:NSTextAlignmentCenter numberOfLines:1];
        _title_label.text = @"用户登录";
        [self addSubview:_title_label];
    }
    return _title_label;
}

- (UILabel *)name_label{
    if (!_name_label) {
        _name_label = [UILabel labelWithTextColor:UIColor.blackColor textFont:DEFAULTFONT(14) textAligment:NSTextAlignmentLeft numberOfLines:1];
        _name_label.text = @"用户名:";
        [self addSubview:_name_label];
    }
    return _name_label;
}

- (UILabel *)pwd_label{
    if (!_pwd_label) {
        _pwd_label = [UILabel labelWithTextColor:UIColor.blackColor textFont:DEFAULTFONT(14) textAligment:NSTextAlignmentLeft numberOfLines:1];
        _pwd_label.text = @"密 码:";
        [self addSubview:_pwd_label];
    }
    return _pwd_label;
}

- (UITextField *)user_name_textfield{
    if (!_user_name_textfield) {
        _user_name_textfield = [[UITextField alloc] init];
        _user_name_textfield.placeholder = @"请输入用户名";
        _user_name_textfield.font = [UIFont systemFontOfSize:14];
        _user_name_textfield.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_user_name_textfield];
    }
    return _user_name_textfield;
}

- (UITextField *)user_pwd_textfield{
    if (!_user_pwd_textfield) {
        _user_pwd_textfield = [[UITextField alloc] init];
        _user_pwd_textfield.placeholder = @"请输入密码";
        _user_pwd_textfield.font = [UIFont systemFontOfSize:14];
        _user_pwd_textfield.borderStyle = UITextBorderStyleRoundedRect;
        _user_pwd_textfield.secureTextEntry = YES;
        [self addSubview:_user_pwd_textfield];
    }
    return _user_pwd_textfield;
}

- (UIButton *)submit_button{
    if (!_submit_button) {
        _submit_button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submit_button setTitle:@"登录" forState:UIControlStateNormal];
        [_submit_button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_submit_button setBackgroundColor:UIColor.blueColor];
        _submit_button.titleLabel.font = DEFAULTFONT(17);
        _submit_button.layer.cornerRadius = 10.f;
        _submit_button.layer.masksToBounds = YES;
        [self addSubview:_submit_button];
    }
    return _submit_button;
}

@end
