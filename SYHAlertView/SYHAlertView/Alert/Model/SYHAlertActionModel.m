//
//  SYHAlertActionModel.m
//  SYHAlertView
//
//  Created by harry on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "SYHAlertActionModel.h"

@implementation SYHAlertActionModel

- (instancetype)initWithTitle:(NSString *)title style:(SYHAlertActionType)style actionHandler:(ClickAlertBtnBlock)actionHandler
{
    if (self = [super init]) {
        self.actionTitle = title;
        self.style = style;
        self.actionHandler = actionHandler;
    }
    return self;
}

+ (instancetype)actionWithTitle:(NSString *)title style:(SYHAlertActionType)style actionHandler:(ClickAlertBtnBlock)actionHandler
{
    return [[self alloc] initWithTitle:title style:style actionHandler:actionHandler];
}

@end
