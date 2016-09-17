//
//  JXTimerButton.m
//  JXTimer
//
//  Created by 王加祥 on 16/7/2.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXTimerButton.h"

@implementation JXTimerButton

/**
 *  初始化方法
 *
 *  @param frame frame
 *
 *  @return 实例化对象
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"点击发送" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.bounds = CGRectMake(0, 0, 80, 40);
        self.backgroundColor = [UIColor colorWithRed:229/256.0 green:80/256.0 blue:31/256.0 alpha:1.0];
//        self.backgroundColor = [UIColor whiteColor];

        [self addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchDown];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
}


#pragma mark - Delegate
- (void)btnclick {
    if ([self.delegate respondsToSelector:@selector(timerButtonDidClick:)]) {
        [self.delegate timerButtonDidClick:self];
    }
}

#pragma mark - 开启倒计时效果
// 开启倒计时效果
-(void)openCountdown
{
    
    __block NSInteger time = 119; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self setTitle:@"重新发送" forState:UIControlStateNormal];
                [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 120;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self setTitle:[NSString stringWithFormat:@"重新发送(%.3d)", seconds] forState:UIControlStateNormal];
                self.titleLabel.font=[UIFont systemFontOfSize:12.0];
                [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}



@end
