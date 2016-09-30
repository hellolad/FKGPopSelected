//
//  FKGPopOption.h
//  FKGPopOption
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FKGPopActionHandler)(int index);
@interface FKGPopOption : UIView

@property (nonatomic, strong) NSArray *selectContents;  // 内容数组
@property (nonatomic, strong) NSArray *selectImages;    // 图片数组

/**
 *  加载 Pop
 *  @param height 一个选项的高度 30 40 50 ...
 *  @param mutiple 宽度(屏幕的倍数) 0.3 0.2 0.1
 *  @param toFrame 基于哪个按钮的frame值
 */
- (void) setupPopSelectedViewOfHeight:(float)height ofMutiple:(float)mutiple toFrame:(CGRect)toFrame handler:(FKGPopActionHandler)handler;

/**
 *  以后会添加更多好用的东西，优化现有的东西。
 */

@end
