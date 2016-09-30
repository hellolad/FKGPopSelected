//
//  FKGPopOption
//  FKGPopOption
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "FKGPopOption.h"

@interface FKGPopOption ()
@property (nonnull, strong) UIView *backgroundView;
@end

@implementation FKGPopOption {
    
    FKGPopOptionBlock _handler;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
    }
    return self;
}

- (instancetype) option_setupPopOption:(FKGPopOptionBlock)block whichFrame:(CGRect)frame {
    [self _setupBackgourndview:frame];
    return self;
}

- (void) option_show {
    [UIView animateWithDuration:0.2f animations:^{
        self.backgroundView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapGesturePressed)];
        [self addGestureRecognizer:tapGesture];
    }];
}


#pragma mark - private
- (void) _tapGesturePressed {
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}
// 创建背景
- (void) _setupBackgourndview:(CGRect)whichFrame {
    self.backgroundView = [UIView new];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    self.backgroundView.alpha = 0.0f;
    [self addSubview:self.backgroundView];
    [self _setupOptionButton];
    [self _tochangeBackgroudViewFrame:whichFrame];
}
- (void) _setupOptionButton {
    if ((self.option_optionContents&&self.option_optionContents.count>0)) {
        for (NSInteger i = 0; i < self.option_optionContents.count; i++) {
            UIButton *optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
            optionButton.frame = CGRectMake(0,
                                            self.option_lineHeight*i,
                                            self.frame.size.width*self.option_mutiple,
                                            self.option_lineHeight);
            optionButton.tag = i;
            [optionButton addTarget:self action:@selector(buttonSelectAction:)
                   forControlEvents:UIControlEventTouchUpInside];
            [optionButton addTarget:self action:@selector(buttonSelectDown:)
                   forControlEvents:UIControlEventTouchDown];
            [optionButton addTarget:self action:@selector(buttonSelectOutside:)
                   forControlEvents:UIControlEventTouchUpOutside];
            [self.backgroundView addSubview:optionButton];
            
            [self _setupOptionContent:optionButton];
        }
    }
}
- (void) _setupOptionContent:(UIButton *)optionButton {
    if(self.option_optionImages&&self.option_optionImages.count>0) {
        UIImageView *headImageView = [UIImageView new];
        headImageView.frame = CGRectMake(14, 7, self.option_lineHeight-14, self.option_lineHeight-14);
        headImageView.image = [UIImage imageNamed:self.option_optionImages[optionButton.tag]];
        [optionButton addSubview:headImageView];
        
        UILabel *contentLabel = [UILabel new];
        contentLabel.frame = CGRectMake(self.option_lineHeight+7,
                                        0,
                                        self.frame.size.width-(self.option_lineHeight-14),
                                        self.option_lineHeight);
        contentLabel.text = self.selectContents[optionButton.tag];
        contentLabel.textColor = [UIColor darkGrayColor];
        contentLabel.font = [UIFont systemFontOfSize:15];
        [optionButton addSubview:contentLabel];
    } else {
        UILabel *contentLabel = [UILabel new];
        [optionButton addSubview:contentLabel];
        contentLabel.frame = optionButton.bounds;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.text = self.selectContents[optionButton.tag];
        contentLabel.textColor = [UIColor darkGrayColor];
        contentLabel.font = [UIFont systemFontOfSize:15];
    }
    
    if(optionButton.tag != 0) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        lineView.frame = CGRectMake(0,
                                    self.option_lineHeight*optionButton.tag,
                                    self.frame.size.width*self.option_mutiple,
                                    1);
        [self.backgroundView addSubview:lineView];
    }
}
- (void) _tochangeBackgroudViewFrame:(CGRect)whichFrame {
    CGFloat which_x = whichFrame.origin.x;
    CGFloat which_w = whichFrame.size.width;
    
    CGFloat backgournd_x = whichFrame.origin.x+whichFrame.size.width/2-(self.frame.size.width*self.option_mutiple/2);
    CGFloat backgournd_y = whichFrame.origin.y+whichFrame.size.height+10;
    CGFloat backgournd_w = self.frame.size.width * self.option_mutiple;
    CGFloat backgournd_h = self.option_lineHeight * self.selectContents.count;
    
    CGFloat self_w = self.frame.size.width;
    
    if(which_x<=self_w*self.option_mutiple/2) {
        backgournd_x = 10;
    }
    if (self_w-which_x<= self_w*self.option_mutiple/2) {
        backgournd_x = self_w - self_w * self.option_mutiple - 10;
    }
    
    self.backgroundView.frame = CGRectMake(backgournd_x, backgournd_y, backgournd_w, backgournd_h);
    self.backgroundView.layer.cornerRadius = 5;
    self.backgroundView.layer.masksToBounds = YES;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Select"]];
    [self addSubview:imageView];
    imageView.frame = CGRectMake(which_x+which_w/2-10,
                                 backgournd_h-15,
                                 20,
                                 15);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}








#pragma mark --------  init

- (instancetype) init {
    
    self = [super init];
    
    if(self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return self;
}

#pragma mark -------- setup

- (void) setupPopSelectedViewOfHeight:(float)height ofMutiple:(float)mutiple toFrame:(CGRect)toFrame handler:(FKGPopOptionBlock)handler {
    
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    [self addSubview:v];
    
    if(self.selectContents && self.selectContents.count > 0) {
        
        _handler = handler;
        
        for(int i = 0; i < self.selectContents.count; i++) {
            UIButton *b = [UIButton new];
            [v addSubview:b];
            
            b.frame = CGRectMake(0, height * i, self.frame.size.width * mutiple, height);
            b.tag = i;
            
            [b addTarget:self action:@selector(buttonSelectAction:) forControlEvents:UIControlEventTouchUpInside];
            [b addTarget:self action:@selector(buttonSelectDown:) forControlEvents:UIControlEventTouchDown];
            [b addTarget:self action:@selector(buttonSelectOutside:) forControlEvents:UIControlEventTouchUpOutside];
            
            if(self.selectImages && self.selectImages.count > 0) {
                
                UIImageView *image = [UIImageView new];
                image.frame = CGRectMake(14, 7, height-14, height-14);
                image.image = [UIImage imageNamed:self.selectImages[i]];
                [b addSubview:image];
                
                UILabel *label = [UILabel new];
                label.frame = CGRectMake(14+(height-14)+7, 0, self.frame.size.width-(height-14), height);
                label.text = self.selectContents[i];
                label.textColor = [UIColor darkGrayColor];
                label.font = [UIFont systemFontOfSize:15];
                [b addSubview:label];
                
            } else {
                
                UILabel *label = [UILabel new];
                label.frame = b.bounds;
                label.textAlignment = NSTextAlignmentCenter;
                label.text = self.selectContents[i];
                label.textColor = [UIColor darkGrayColor];
                label.font = [UIFont systemFontOfSize:15];
                [b addSubview:label];
            }
            
            if(i != 0) {
                
                UIView *lineView = [UIView new];
                lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
                [v addSubview:lineView];
                lineView.frame = CGRectMake(0, height * i, self.frame.size.width * mutiple, 1);
            }
        }
        
    } else {
        
        NSLog(@"没有初始化 selects, 或者 selects.count 小于 0");
    }
    
    float tox = toFrame.origin.x;
    float vx = toFrame.origin.x+toFrame.size.width/2-(self.frame.size.width*mutiple/2);
    
    if(tox <= self.frame.size.width*mutiple/2) {
        
        vx = 10;
    }
    if (self.frame.size.width - tox <= self.frame.size.width*mutiple/2) {
        
        vx = self.frame.size.width - self.frame.size.width * mutiple - 10;
    }
    
    v.frame = CGRectMake(vx, toFrame.origin.y+toFrame.size.height+10, self.frame.size.width * mutiple, height * self.selectContents.count);
    v.layer.cornerRadius = 5;
    v.layer.masksToBounds = YES;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Select"]];
    [self addSubview:imageView];
    imageView.frame = CGRectMake(toFrame.origin.x+toFrame.size.width/2-10, v.frame.origin.y-15, 20, 15);
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    v.tag = 1;  // view tag
    v.alpha = 0.0;
    
    imageView.tag = 10001;  // imageView tag
    imageView.alpha = 0.0;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        v.alpha = 1.0;
        imageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHideView)];
        [self addGestureRecognizer:tap];
    }];
}

#pragma mark -------- inside outside down

- (void) buttonSelectAction:(UIButton *)sender {
    _handler((int)sender.tag);
    sender.backgroundColor = [UIColor whiteColor];
}
- (void) buttonSelectDown:(UIButton *)sender {
    sender.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
}
- (void) buttonSelectOutside:(UIButton *)sender {
    sender.backgroundColor = [UIColor whiteColor];
}


#pragma mark -------- hide

- (void) tapHideView {
    
    UIView *v = (UIView *)[self viewWithTag:1];
    UIImageView *iv = (UIImageView *)[self viewWithTag:10001];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        v.alpha = 0.0f;
        iv.alpha = 0.0f;
    } completion:^(BOOL finished) {
        
        _handler = nil;
        [self removeFromSuperview];
    }];
}

@end
