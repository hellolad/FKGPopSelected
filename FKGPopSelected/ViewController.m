//
//  ViewController.m
//  FKGPopSelected
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "ViewController.h"
#import "FKGPopOption.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupWhichButton];
}

#pragma mark --------  setup window

- (void) _setupWhichButton {
    UIButton *optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:optionButton];
    optionButton.frame = CGRectMake(100, 100, 100, 30);
    optionButton.backgroundColor = [UIColor redColor];
    [optionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [optionButton setTitle:@"Option" forState:UIControlStateNormal];
    [optionButton addTarget:self action:@selector(_buttonOptionPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) _buttonOptionPressed:(UIButton *)optionButton {
    
    // 注意：由convertRect: toView 获取到屏幕上该控件的绝对位置。
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    CGRect frame = [optionButton convertRect:optionButton.bounds toView:window];
    
    
    FKGPopOption *s = [[FKGPopOption alloc] init];
    s.option_optionContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
    s.option_optionImages = @[@"select1",@"select2",@"select3",@"select4",@"select5"];
    s.option_lineHeight = 40.0f;
    s.option_mutiple = 0.35f;
    [[s option_setupPopOption:^(NSInteger index) {
        NSLog(@"%ld", index);
    } whichFrame:frame] option_show];
//    s.selectContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
//    s.selectImages = @[@"select1.png",@"select2",@"select3",@"select4",@"select5"];
//    [s setupPopSelectedViewOfHeight:40 ofMutiple:0.8 toFrame:frame handler:^(NSInteger index) {
//        NSLog(@"index = %d", index);
//    }];
}

@end
