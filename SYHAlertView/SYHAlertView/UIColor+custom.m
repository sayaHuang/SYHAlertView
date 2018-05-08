//
//  UIColor+custom.m
//  SYHAlertView
//
//  Created by saya on 2018/4/11.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "UIColor+custom.h"

@implementation UIColor (custom)

+(UIColor*)syh_colorWithHexValue:(NSString *)hexStr
{
    NSUInteger hexValue = strtoul([hexStr UTF8String], 0, 16);
    if(hexValue == ERANGE)
    {
        NSLog(@"hex value error! hexStr = %@", hexStr);
        return nil;
    }
    CGFloat a = ((hexValue & 0xFF000000) >> 24) / 255.0;
    CGFloat r = ((hexValue & 0x00FF0000) >> 16) / 255.0;
    CGFloat g = ((hexValue & 0x0000FF00) >> 8) / 255.0;
    CGFloat b = (hexValue & 0x000000FF) / 255.0;
    UIColor* color = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    return color;
}

@end
