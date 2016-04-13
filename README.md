# FKGPopSelected

<p>点击按钮之后弹出一个选项框，可以自定义选项框的内容。</p>
<p>使用方法：</p>
<p>1.导入两个文件（FKGPopSelected.h/.m)</p>
<p>2.在需要的地方添加如下代码：</p>
```objective-c
// 1.实例化
    FKGPopSelected *s = [[FKGPopSelected alloc] init];
    
    // 2.初始化内容数组
    s.selects = @[@"选项一", @"选项二", @"选项三", @"选项四",@"选项五", @"选项六"];
    
    // 3.加载Pop框
    [s setupPopSelectedViewOfHeight:40 ofMutiple:0.35 toFrame:sender.frame handler:^(int index) {
        NSLog(@"index = %d", index);
    }];

```
