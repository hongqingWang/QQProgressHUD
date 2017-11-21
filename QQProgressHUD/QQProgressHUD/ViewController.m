//
//  ViewController.m
//  QQProgressHUD
//
//  Created by Mac on 2017/11/21.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+QQ.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

/** TableView */
@property (nonatomic, strong) UITableView *tableView;
/** 标题 */
@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            // 文字
            [MBProgressHUD qq_showText:@"加载成功..."];
        }
            break;
        case 1:
        {
            // 指示器
            [MBProgressHUD qq_showIndicator];
        }
            break;
        case 2:
        {
            // 文字 + 指示器
            [MBProgressHUD qq_showTextAndIndicator:@"正在加载..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                // 隐藏
                [MBProgressHUD qq_hideHUD];
            });
        }
            break;
        case 3:
        {
            // 成功图片
            [MBProgressHUD qq_showSuccess];
        }
            break;
        case 4:
        {
            // 成功图片 + 文字(false)
            [MBProgressHUD qq_showSuccess:@"修改成功!"];
        }
            break;
        case 5:
        {
            // 失败图片
            [MBProgressHUD qq_showError];
        }
            break;
        case 6:
        {
            // 失败图片 + 文字(false)
            [MBProgressHUD qq_showError:@"网络出错!"];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Getters and Setters
- (UITableView *)tableView {
    
    if (_tableView == nil) {
        
        CGRect frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray *)titles {
    
    if (_titles == nil) {
        
        _titles = @[
                    @"文字",
                    @"指示器",
                    @"文字 + 指示器",
                    @"成功图片",
                    @"成功图片 + 文字(false)",
                    @"失败图片",
                    @"失败图片 + 文字(false)"
                    ];
    }
    return _titles;
}

@end
