//
//  SYHAlertActionModel.h
//  SYHAlertView
//
//  Created by harry on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//alert 弹窗 按钮状态
typedef NS_ENUM(NSInteger, SYHAlertActionType)
{
    SYHAlertActionDefault  = 1,     //灰色按键
    SYHAlertActionConfirm  = 2,     //红色按键
};

typedef NS_ENUM(NSInteger, SYHAlertViewControllerType)
{
    SYHAlertViewControllerWithTitle     = 1,     //有标题
    SYHAlertViewControllerWithoutTitle  = 2,     //没有标题
};

typedef void(^ClickAlertBtnBlock)(void);

@interface SYHAlertActionModel : NSObject

@property(nonatomic, copy)NSString*     actionTitle;
@property(nonatomic)SYHAlertActionType   style;
@property(nonatomic, copy)ClickAlertBtnBlock    actionHandler;

+ (instancetype)actionWithTitle:(NSString *)title style:(SYHAlertActionType)style actionHandler:(ClickAlertBtnBlock)actionHandler;

@end
