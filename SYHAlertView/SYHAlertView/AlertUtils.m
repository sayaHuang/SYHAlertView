//
//  AlertUtils.m
//  SYHAlertView
//
//  Created by saya on 2018/4/18.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "AlertUtils.h"
#import "SYHAlertActionModel.h"
#import "SYHAlertViewController.h"

@implementation AlertUtils

+(void)showAlertControllerWithTitle:(NSString *)title content:(NSString *)content showViewController:(nonnull UIViewController*)viewController actionHandle:(NSArray<SYHAlertActionModel*>*)handlers
{
    if (content == nil ||
        ![content isKindOfClass:[NSString class]] ||
        [content isEqualToString:@""]) {
        NSLog(@"所返回的数据为空 或者 不是字符串类型数据");
        //        content = @"所返回的数据为空 或者 不是字符串类型数据";
        return;
    }
    
    SYHAlertViewControllerType alertStyle;
    if ([title isEqualToString:@""] || title == nil) {
        alertStyle = SYHAlertViewControllerWithoutTitle;
    }
    else
    {
        alertStyle = SYHAlertViewControllerWithTitle;
    }
    
    SYHAlertViewController *alertController = [SYHAlertViewController alertViewWithTitle:title message:content showViewController:viewController preferredStyle:alertStyle alertActions:handlers];
    
    
    if(!viewController)
    {
        viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    [viewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)showSingleButtonSelfDefineAlertWithTitle:(nullable NSString*)title
                                         content:(nullable NSString*)content
                              showViewController:(nullable UIViewController*)viewController
                                     actionTitle:(NSString*)actionTitle
                                    actionHandle:(nullable ClickAlertBtnBlock)handler
{
    SYHAlertActionModel *alertAction = [SYHAlertActionModel actionWithTitle:actionTitle style:SYHAlertActionConfirm actionHandler:handler];
    NSArray *actions = @[alertAction];
    
    [self showAlertControllerWithTitle:title content:content showViewController:viewController actionHandle:[actions copy]];
}

+ (void)showCommonSelfDefineAlertWithTitle:(nullable NSString *)title
                                   content:(nullable NSString *)content
                        showViewController:(nullable UIViewController*)viewController
                          leftActionTitles:(NSString *)leftTitles
                         leftActionHandles:(nullable ClickAlertBtnBlock)leftHandler
                         rightActionTitles:(NSString *)rightTitles
                        rightActionHandles:(nullable ClickAlertBtnBlock)rightHandler
{
    
    SYHAlertActionModel *alertAction_left = [SYHAlertActionModel actionWithTitle:leftTitles style:SYHAlertActionDefault actionHandler:leftHandler];
    SYHAlertActionModel *alertAction_right = [SYHAlertActionModel actionWithTitle:rightTitles style:SYHAlertActionConfirm actionHandler:rightHandler];
    NSArray *actions = @[alertAction_left,alertAction_right];
    
    [self showAlertControllerWithTitle:title content:content showViewController:viewController actionHandle:[actions copy]];
}

+ (void)showContent:(NSString *)content inVC:(UIViewController *)vc {
    [self showSingleButtonSelfDefineAlertWithTitle:nil content:content showViewController:vc actionTitle:@"确定" actionHandle:nil];
}

@end
