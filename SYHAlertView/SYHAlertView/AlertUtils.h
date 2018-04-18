//
//  AlertUtils.h
//  SYHAlertView
//
//  Created by saya on 2018/4/18.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^ClickAlertBtnBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface AlertUtils : NSObject

+ (void)showContent:(NSString *)content inVC:(UIViewController *)vc;

//2.0
+ (void)showSingleButtonSelfDefineAlertWithTitle:(nullable NSString*)title
                                         content:(nullable NSString*)content
                              showViewController:(nullable UIViewController*)viewController
                                     actionTitle:(NSString*)actionTitle
                                    actionHandle:(nullable ClickAlertBtnBlock)handler;

+ (void)showCommonSelfDefineAlertWithTitle:(nullable NSString *)title
                                   content:(nullable NSString *)content
                        showViewController:(nullable UIViewController*)viewController
                          leftActionTitles:(NSString *)leftTitles
                         leftActionHandles:(nullable ClickAlertBtnBlock)leftHandler
                         rightActionTitles:(NSString *)rightTitles
                        rightActionHandles:(nullable ClickAlertBtnBlock)rightHandler;

@end

NS_ASSUME_NONNULL_END
