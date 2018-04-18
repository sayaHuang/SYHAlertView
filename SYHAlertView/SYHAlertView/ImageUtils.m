//
//  ImageUtils.m
//  SYHAlertView
//
//  Created by saya on 2018/4/17.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import "ImageUtils.h"

@implementation ImageUtils


+(UIImageView*)createLineImageViewWithFrame:(CGRect)frame andColor:(NSString *)hexColor
{
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [ImageUtils createRectImageByColor:hexColor andFrame:frame];
    UIGraphicsEndImageContext();
    
    return imageView;
}

+(UIImage*)createRectImageByColor:(NSString *)hexColor andFrame:(CGRect)frame
{
    NSUInteger hexValue = strtoul([hexColor UTF8String], 0, 16);
    CGFloat a,r,g,b;
    if(hexValue == ERANGE)
    {
        NSLog(@"hex value error! hexStr = %@", hexColor);
        a = 1;
        r = 1;
        g = 1;
        b = 1;
    }
    else
    {
        a = ((hexValue & 0xFF000000) >> 24) / 255.0;
        r = ((hexValue & 0x00FF0000) >> 16) / 255.0;
        g = ((hexValue & 0x0000FF00) >> 8) / 255.0;
        b = (hexValue & 0x000000FF) / 255.0;
    }
    UIImage* image = [[UIImage alloc] init];
    [image drawInRect:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef ctRef = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctRef, CGRectMake(0, 0, frame.size.width, frame.size.height));
    CGContextSetLineCap(ctRef, kCGLineCapRound);
    CGContextSetLineWidth(ctRef, frame.size.height*2);  //线宽
    CGContextSetAllowsAntialiasing(ctRef, YES);
    CGContextSetRGBStrokeColor(ctRef, r, g, b, a);  //颜色
    CGContextBeginPath(ctRef);
    CGContextMoveToPoint(ctRef, 0, 0);  //起点坐标
    CGContextAddLineToPoint(ctRef, frame.size.width, 0);   //终点坐标
    CGContextStrokePath(ctRef);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

@end
