//
//  FKGPopOption
//  FKGPopOption
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "FKGPopOption.h"

@implementation FKGPopOption {
    
    FKGPopActionHandler _handler;
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

- (void) setupPopSelectedViewOfHeight:(float)height ofMutiple:(float)mutiple toFrame:(CGRect)toFrame handler:(FKGPopActionHandler)handler {
    
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
