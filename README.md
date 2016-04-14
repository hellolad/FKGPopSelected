# FKGPopSelected

<p>使用方法：</p>
<p>1.导入两个文件（FKGPopSelected.h/.m)</p>
<p>2.在需要的地方添加如下代码：</p>
```objective-c
// 用法
// 1.实例化
FKGPopSelected *s = [[FKGPopSelected alloc] init];

// 2.初始化内容数组 (如果不添加图片数组就不会有图片，其他内容自动居中)
s.selectContents = @[@"首页", @"个人中心", @"问题一箩筐", @"任务管理",@"有奖问答"];
s.selectImages = @[@"select1",@"select2",@"select3",@"select4",@"select5"];

// 3.加载Pop框
[s setupPopSelectedViewOfHeight:40 ofMutiple:0.35 toFrame:sender.frame handler:^(int index) {

NSLog(@"index = %d", index);
}];

// 4.不需要add到主界面。


```
