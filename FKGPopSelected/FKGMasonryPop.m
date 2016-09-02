//
//  FKGMasonryPop.m
//  FKGPopSelected
//
//  Created by ZhaoHeng on 16/9/2.
//  Copyright © 2016年 forkingghost. All rights reserved.
//
//  基于Masonry的 弹出泡泡View

#import "FKGMasonryPop.h"

@interface FKGMasonryPop ()
@property (nonatomic, strong) UIButton    *backgroundButton;
@property (nonatomic, strong) UIImageView *triangleImageView;
@property (nonatomic, strong) UIView      *backgourndView;

@end

@implementation FKGMasonryPop {
    float fp_backalpha;
    float fp_radius;
    BOOL  fp_shouldShowPop;
    BOOL  fp_animate;
    float fp_animatetime;
}

#pragma mark - init with frame
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initparameters];
        [self setupContentView];
    }
    return self;
}
- (void) initparameters {
    fp_radius = self.radius ? self.radius.floatValue : 5.0f;
    fp_shouldShowPop = NO;
    fp_animate = self.animate ? self.animate.boolValue : YES;
    fp_animatetime = self.animatetime ? self.animatetime.floatValue : 0.3f;
    fp_backalpha = self.backalpha ? self.backalpha.floatValue : 0.3f;
}

#pragma mark - setup content view
- (void) setupContentView {
    self.backgroundButton = ({
        UIButton *backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backgroundButton];
        backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:fp_backalpha];
        [backgroundButton addTarget:self action:@selector(backgroundButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        backgroundButton;
    });
    self.triangleImageView = ({
        UIImageView *triangleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Select"]];
        [self.backgroundButton addSubview:triangleImageView];
        triangleImageView;
    });
    self.backgourndView = ({
        UIView *backgourndView = [UIView new];
        [self.backgroundButton addSubview:backgourndView];
        backgourndView.backgroundColor = [UIColor whiteColor];
        backgourndView.layer.cornerRadius = fp_radius;
        backgourndView.layer.masksToBounds = YES;
        backgourndView;
    });
    
    [self updateConstraintsIfNeeded];
    [self setNeedsUpdateConstraints];
    [self layoutIfNeeded];
}
- (void) updateConstraints {
    [super updateConstraints];
}

#pragma mark - event
- (void) backgroundButtonPressed {
    fp_shouldShowPop = !fp_shouldShowPop;
    if (fp_shouldShowPop) {
        [self show];
    } else {
        [self hide];
    }
}

#pragma mark - 显示隐藏
- (void) show {
    [UIView animateWithDuration:fp_animatetime animations:^{
        self.backgroundButton.alpha = 0.0f;
        self.backgourndView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.backgroundButton.hidden = NO;
    }];
}
- (void) hide {
    [UIView animateWithDuration:fp_animatetime animations:^{
        self.backgroundButton.alpha = 1.0f;
        self.backgourndView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        self.backgroundButton.hidden = YES;
    }];
}

@end