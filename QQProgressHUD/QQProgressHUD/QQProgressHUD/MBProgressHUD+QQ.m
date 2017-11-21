//
//  MBProgressHUD+QQ.m
//  QQProgressHUD
//
//  Created by Mac on 2017/11/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "MBProgressHUD+QQ.h"

@implementation MBProgressHUD (QQ)

#pragma mark - 文字
+ (MBProgressHUD *)qq_showText:(NSString *)text {
    
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置显示样式(这里设置为只显示文字)
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.textColor = QQ_PROGRESS_HUD_TEXT_COLOR;
    hud.label.font = QQ_PROGRESS_HUD_FONT;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = QQ_PROGRESS_HUD_INDICATOR_BACKGROUND_COLOR;
    [hud removeFromSuperViewOnHide];
    [hud hideAnimated:YES afterDelay:QQ_PROGRESS_HUD_ANIMATE_DURATION];
    
    return hud;
}

#pragma mark - 指示器
+ (MBProgressHUD *)qq_showIndicator {
    
    return [self showText:nil toView:nil];
}

#pragma mark - 文字 + 指示器
+ (MBProgressHUD *)qq_showTextAndIndicator:(NSString *)text {
    
    return [self showText:text toView:nil];
}

+ (MBProgressHUD *)showText:(NSString *)text toView:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    hud.activityIndicatorColor = QQ_PROGRESS_HUD_INDICATOR_COLOR;
#pragma clang diagnostic pop
//    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor redColor];
//    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setBackgroundColor:[UIColor redColor]];
    hud.label.text = text;
    hud.label.textColor = QQ_PROGRESS_HUD_TEXT_COLOR;
    hud.label.font = QQ_PROGRESS_HUD_FONT;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = QQ_PROGRESS_HUD_INDICATOR_BACKGROUND_COLOR;
    [hud removeFromSuperViewOnHide];
    
    // 添加蒙版效果
    hud.backgroundView.color = QQ_PROGRESS_HUD_BACKGROUND_COLOR;
    [hud hideAnimated:YES afterDelay:QQ_PROGRESS_HUD_ANIMATE_DELAY_DURATION];
    
    return hud;
}

#pragma mark - 成功图片
+ (void)qq_showSuccess {
    
    [self qq_showSuccess:nil];
}

#pragma mark - 成功图片 + 文字(false)
+ (void)qq_showSuccess:(NSString *)text {
    
    [self showSuccess:text toView:nil];
}

+ (void)showSuccess:(NSString *)text toView:(UIView *)view {
    
    [self show:text icon:@"success.png" view:view];
}

#pragma mark - 失败图片
+ (void)qq_showError {
    
    [self qq_showError:nil];
}

#pragma mark - 失败图片 + 文字(false)
+ (void)qq_showError:(NSString *)text {
    
    [self showError:text toView:nil];
}

+ (void)showError:(NSString *)text toView:(UIView *)view {
    
    [self show:text icon:@"error.png" view:view];
}

/**
 * `成功图片`和`失败图片`都会调用的方法
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
//    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor redColor];
//    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]] setBackgroundColor:[UIColor redColor]];
    hud.label.text = text;
    hud.label.textColor = QQ_PROGRESS_HUD_TEXT_COLOR;
    hud.label.font = QQ_PROGRESS_HUD_FONT;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = QQ_PROGRESS_HUD_INDICATOR_BACKGROUND_COLOR;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:QQ_PROGRESS_HUD_ANIMATE_DURATION];
}

#pragma mark - 隐藏
+ (void)qq_hideHUD {
    
    [self hideHUDForView:nil];
}

+ (void)hideHUDForView:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

@end
