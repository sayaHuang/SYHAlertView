//
//  SYHMacros.h
//  SYHAlertView
//
//  Created by saya on 2018/4/17.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef SYHMacros_h
#define SYHMacros_h

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#define ONE_PIXEL    (1.0/[UIScreen mainScreen].scale)

//适配方案
//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (SCREEN_WIDTH / 375.0)
#define kScreenHeightRatio (SCREEN_HEIGHT / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define SCREEN_HEIGHT      [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH       [[UIScreen mainScreen] bounds].size.width


#define MAIN_DEEP_GRAY                  @"0xff80848c"//辅助色2
#define MAINCOLOR_RED                   @"0xffd20000" //主体颜色
#define NAVIGATION_BAR_BLACK_COLOR      @"0xff323743"//辅助色1 导航栏颜色
#define ALERT_BACKGROUND_COLOR          @"0x7f000000"//自定义alert 弹窗的背景颜色
#define BACKGROUND_VIEW_GRAY            @"0xfff2f2f3"//背景灰色
#define MIAN_CONTENT_FONT_COLOR         @"0xff323743"//主要文字色 不加粗
#define BORDER_COLOR                    @"0xffdbdfe8"

#endif /* SYHMacros_h */
