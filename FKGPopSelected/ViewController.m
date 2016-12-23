//
//  ViewController.m
//  FKGPopSelected
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "ViewController.h"
#import "FKGPopOption.h"
#import "SecondViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupWhichButton];
}

#pragma mark --------  setup window

- (void) _setupWhichButton {
    UIButton *optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:optionButton];
    optionButton.frame = CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 30);
    optionButton.backgroundColor = [UIColor orangeColor];
    [optionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [optionButton setTitle:@"Option" forState:UIControlStateNormal];
    [optionButton addTarget:self action:@selector(_buttonOptionPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) _buttonOptionPressed:(UIButton *)optionButton {
    
    // 注意：由convertRect: toView 获取到屏幕上该控件的绝对位置。
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    CGRect frame = [optionButton convertRect:optionButton.bounds toView:window];
    
    FKGPopOption *s = [[FKGPopOption alloc] initWithFrame:self.view.bounds];
    s.option_optionContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
    s.option_optionImages = @[@"select1",@"select2",@"select3",@"select4",@"select5"];
    // 使用链式语法直接展示 无需再写 [s option_show];

    [[s option_setupPopOption:^(NSInteger index, NSString *content) {
        NSLog(@"你选中了第%ld行 选项为：%@", index, content);
        SecondViewController *second = [SecondViewController new];
        [self.navigationController pushViewController:second animated:YES];
    } whichFrame:frame animate:YES] option_show];
}

@end
