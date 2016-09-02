//
//  FKGMasonryPop.h
//  FKGPopSelected
//
//  Created by ZhaoHeng on 16/9/2.
//  Copyright © 2016年 forkingghost. All rights reserved.
//
//  基于Masonry的 弹出泡泡View

#import <UIKit/UIKit.h>

@interface FKGMasonryPop : UIView
@property (nonatomic, strong) NSNumber *backalpha;  // 最后面的背景的透明度 @(0.3f)
@property (nonatomic, strong) NSNumber *radius;     // 背景块儿的圆角度 @(5.0f)
@property (nonatomic, strong) NSNumber *animate;    // 是否有动画 @(YES)
@property (nonatomic, strong) NSNumber *animatetime;// 动画时长   @(0.3f)

/**
 *  显示
 */
- (void) show;

/**
 *  隐藏
 */
- (void) hide;

@end
