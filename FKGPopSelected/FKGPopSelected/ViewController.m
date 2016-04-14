//
//  ViewController.m
//  FKGPopSelected
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "ViewController.h"
#import "FKGPopSelected.h"

@implementation ViewController {
    
    float _swidth;
    float _sheight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _swidth = [UIScreen mainScreen].bounds.size.width;
    _sheight = [UIScreen mainScreen].bounds.size.height;
    
    [self setupWindow];
    
}

#pragma mark --------  setup window

- (void) setupWindow {
    
    for(int i = 0; i < 1; i++) {
        
        UIButton *button = [UIButton new];
        [self.view addSubview:button];
        
        button.frame = CGRectMake(self.view.frame.size.width-60, 30, 50, 40);
        [button setTitle:@"选项1" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.tag = i;
        [button addTarget:self action:@selector(buttonSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void) buttonSelectedAction:(UIButton *)sender {
    
    // 用法
    // 1.实例化
    FKGPopSelected *s = [[FKGPopSelected alloc] init];
    
    // 2.初始化内容数组
    s.selectContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
    s.selectImages = @[@"select1",@"select2",@"select3",@"select4",@"select5"];
    
    // 3.加载Pop框
    [s setupPopSelectedViewOfHeight:40 ofMutiple:0.35 toFrame:sender.frame handler:^(int index) {
        
        NSLog(@"index = %d", index);
    }];
}

@end
