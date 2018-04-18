//
//  AppDelegate.m
//  SYHAlertView
//
//  Created by harry on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "AppDelegate.h"
/**键盘相关*/
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self keyBoard];
    return YES;
}

- (void)keyBoard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    //允许开启 IQKeyboardManager
    manager.enable = YES;
    //点击空白处 收起键盘
    manager.shouldResignOnTouchOutside = YES;
    //键盘上方 显示工具条
    manager.enableAutoToolbar = YES;
    //控制键盘上的工具条文字颜色是否用户自定义
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    //是否显示 文本框中的Placeholder文字
    manager.shouldShowToolbarPlaceholder = NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
