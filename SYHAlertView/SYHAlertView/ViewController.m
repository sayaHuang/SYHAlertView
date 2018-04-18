//
//  ViewController.m
//  SYHAlertView
//
//  Created by harry on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "ViewController.h"
#import "AlertUtils.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UIButton *showAlertBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)show:(UIButton *)sender {
    if (!_contentTextField.text || [_contentTextField.text isEqualToString:@""]) {
        [AlertUtils showContent:@"请输入需要显示的内容" inVC:self];
        return;
    }
    
    if (!_titleTextField.text) {
        _titleTextField.text = @"";
    }
    
    [AlertUtils showSingleButtonSelfDefineAlertWithTitle:_titleTextField.text content:_contentTextField.text showViewController:self actionTitle:@"确认" actionHandle:^{
        
    }];
    
}

- (IBAction)showDouble:(UIButton *)sender {
    
    if (!_contentTextField.text || [_contentTextField.text isEqualToString:@""]) {
        [AlertUtils showContent:@"请输入需要显示的内容" inVC:self];
        return;
    }
    
    if (!_titleTextField.text) {
        _titleTextField.text = @"";
    }
    
    [AlertUtils showCommonSelfDefineAlertWithTitle:_titleTextField.text content:_contentTextField.text showViewController:self leftActionTitles:@"取消" leftActionHandles:^{
        
    } rightActionTitles:@"确认" rightActionHandles:^{
        
    }];
}



@end
