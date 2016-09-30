//
//  FKGPopOption.h
//  FKGPopOption
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FKGPopOptionBlock)(NSInteger index);
@interface FKGPopOption : UIView

@property (nonatomic, strong) NSArray *selectContents;  // 内容数组
@property (nonatomic, strong) NSArray *selectImages;    // 图片数组

@property (nonatomic, strong) NSArray *option_optionContents;   // 内容数组
@property (nonatomic, strong) NSArray *option_optionImages;     // 图片数组
@property (nonatomic, assign) CGFloat  option_lineHeight;       // 行高
@property (nonatomic, assign) CGFloat  option_mutiple;          // 宽度比

/**
 *  加载 Pop
 *  @param height 一个选项的高度 30 40 50 ...
 *  @param mutiple 宽度(屏幕的倍数) 0.3 0.2 0.1
 *  @param toFrame 基于哪个按钮的frame值
 */
- (void) setupPopSelectedViewOfHeight:(float)height ofMutiple:(float)mutiple toFrame:(CGRect)toFrame handler:(FKGPopOptionBlock)handler;

// 使用链式加载pop框
// block 你选中的选项
- (instancetype) option_setupPopOption:(FKGPopOptionBlock)block whichFrame:(CGRect)frame;
- (void) option_show;

@end
