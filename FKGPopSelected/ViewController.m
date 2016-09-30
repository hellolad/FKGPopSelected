//
//  ViewController.m
//  FKGPopSelected
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "ViewController.h"
#import "FKGPopOption.h"

@implementation ViewController {
    
    float _swidth;
    float _sheight;
    UIButton *_selectButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _swidth = [UIScreen mainScreen].bounds.size.width;
    _sheight = [UIScreen mainScreen].bounds.size.height;
    
    [self setupWindow];
    
}

#pragma mark --------  setup window

- (void) setupWindow {
    
    
    UIView *v = [UIView new];
    v.frame = CGRectMake(10, 100, 100, 50);
    [self.view addSubview:v];
    v.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton new];
    [v addSubview:button];
    
    button.frame = CGRectMake(10, 10, 50, 30);
    [button setTitle:@"选项1" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _selectButton = button;
}

- (void) buttonSelectedAction:(UIButton *)sender {
    
    // 注意：由convertRect: toView 获取到屏幕上该控件的绝对位置。
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    CGRect frame = [_selectButton convertRect:_selectButton.bounds toView:window];
    NSLog(@"%f, %f", frame.origin.x, frame.origin.y);
    
    // 用法
    // 1.实例化
    FKGPopOption *s = [[FKGPopOption alloc] init];
    
    // 2.初始化内容数组
    s.selectContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
    s.selectImages = @[@"select1.png",@"select2",@"select3",@"select4",@"select5"];
    
    // 3.加载Pop框
    [s setupPopSelectedViewOfHeight:40 ofMutiple:0.35 toFrame:frame handler:^(int index) {
        
        NSLog(@"index = %d", index);
    }];
}

@end
