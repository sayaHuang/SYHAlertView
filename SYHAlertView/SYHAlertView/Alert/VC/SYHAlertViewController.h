//
//  SYHAlertViewController.h
//  SYHAlertView
//
//  Created by saya on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYHAlertActionModel.h"



@interface SYHAlertViewController : UIViewController

/**
 alert VC的全能初始化方法

 @param title 弹窗的title
 @param message 弹窗的主题消息
 @param viewController 弹窗present的目标VC
 @param preferredStyle 弹窗的类型,目前分为有标题型和无标题型
 @param alertActions 弹窗的操作按钮点击所执行的blocks 数组
 @return alert VC的实例
 */
+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message showViewController:(UIViewController*)viewController preferredStyle:(SYHAlertViewControllerType)preferredStyle alertActions:(NSArray<SYHAlertActionModel*>*)alertActions;

@end

