//
//  ImageUtils.h
//  SYHAlertView
//
//  Created by saya on 2018/4/17.
//  Copyright © 2018年 sayaHuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject

+(UIImageView*)createLineImageViewWithFrame:(CGRect)frame andColor:(NSString *)hexColor;

+(UIImage*)createRectImageByColor:(NSString *)hexColor andFrame:(CGRect)frame;

@end
