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

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message showViewController:(UIViewController*)viewController preferredStyle:(SYHAlertViewControllerType)preferredStyle alertActions:(NSArray<SYHAlertActionModel*>*)alertActions;

@end

