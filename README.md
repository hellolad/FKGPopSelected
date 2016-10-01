## FKGPopSelected

####使用方法:
1.导入两个文件（FKGPopOption.h&&.m) <br>
2.在需要的地方添加如下代码:
```objective-c
由convertRect: toView 获取到屏幕上该控件的绝对位置。
UIWindow *window = [[UIApplication sharedApplication].delegate window];
CGRect frame = [optionButton convertRect:optionButton.bounds toView:window];

FKGPopOption *s = [[FKGPopOption alloc] initWithFrame:self.view.bounds];
s.option_optionContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
s.option_optionImages = @[@"select1",@"select2",@"select3",@"select4",@"select5"];

// 使用链式语法直接展示 无需再写 [s option_show];
[[s option_setupPopOption:^(NSInteger index, NSString *content) {
    NSLog(@"你选中了第%ld行 选项为：%@", index, content);
} whichFrame:frame animate:YES] option_show];
```
![](http://i1.piimg.com/567571/3cf5ba1693f38c8f.png)
