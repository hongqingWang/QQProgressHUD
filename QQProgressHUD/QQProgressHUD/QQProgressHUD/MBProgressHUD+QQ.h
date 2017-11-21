//
//  MBProgressHUD+QQ.h
//  QQProgressHUD
//
//  Created by Mac on 2017/11/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

/**************************************** 颜色 ****************************************/
#define QQ_PROGRESS_HUD_TEXT_COLOR                      [UIColor colorWithRed:((float)((0xFFFFFF & 0xFF0000) >> 16))/255.0 green:((float)((0xFFFFFF & 0xFF00) >> 8))/255.0 blue:((float)(0xFFFFFF & 0xFF))/255.0 alpha:1.0]
#define QQ_PROGRESS_HUD_INDICATOR_COLOR                 [UIColor colorWithRed:((float)((0xFFFFFF & 0xFF0000) >> 16))/255.0 green:((float)((0xFFFFFF & 0xFF00) >> 8))/255.0 blue:((float)(0xFFFFFF & 0xFF))/255.0 alpha:1.0]
#define QQ_PROGRESS_HUD_INDICATOR_BACKGROUND_COLOR      [UIColor colorWithRed:((float)((0x2D2D2D & 0xFF0000) >> 16))/255.0 green:((float)((0x2D2D2D & 0xFF00) >> 8))/255.0 blue:((float)(0x2D2D2D & 0xFF))/255.0 alpha:1.0]
#define QQ_PROGRESS_HUD_BACKGROUND_COLOR                [UIColor colorWithRed:((float)((0x000000 & 0xFF0000) >> 16))/255.0 green:((float)((0x000000 & 0xFF00) >> 8))/255.0 blue:((float)(0x000000 & 0xFF))/255.0 alpha:0.2]

/**************************************** 时间 ****************************************/
#define QQ_PROGRESS_HUD_ANIMATE_DURATION                1.5
#define QQ_PROGRESS_HUD_ANIMATE_DELAY_DURATION          10

/**************************************** 字体 ****************************************/
#define QQ_PROGRESS_HUD_FONT                            [UIFont fontWithName:@"PingFangSC-Regular" size:15]

@interface MBProgressHUD (QQ)

/**
 * 文字
 */
+ (MBProgressHUD *)qq_showText:(NSString *)text;

/**
 * 指示器
 */
+ (MBProgressHUD *)qq_showIndicator;

/**
 * 文字 + 指示器
 */
+ (MBProgressHUD *)qq_showTextAndIndicator:(NSString *)text;

/**
 * 成功图片
 */
+ (void)qq_showSuccess;

/**
 * 成功图片 + 文字(false)
 */
+ (void)qq_showSuccess:(NSString *)text;

/**
 * 失败图片
 */
+ (void)qq_showError;

/**
 * 失败图片 + 文字(false)
 */
+ (void)qq_showError:(NSString *)text;

/**
 * 隐藏
 */
+ (void)qq_hideHUD;

@end
