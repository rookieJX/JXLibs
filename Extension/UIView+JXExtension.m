//
//  UIView+JXExtension.m
//  JXWeiBo
//
//  Created by 王加祥 on 16/6/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "UIView+JXExtension.h"

@implementation UIView (JXExtension)

- (CGFloat)jx_x {
    return self.frame.origin.x;
}

- (void)setJx_x:(CGFloat)jx_x {
    CGRect frame = self.frame;
    frame.origin.x = jx_x;
    self.frame = frame;
}


- (CGFloat)jx_y {
    return self.frame.origin.y;
}

- (void)setJx_y:(CGFloat)jx_y {
    CGRect frame = self.frame;
    frame.origin.y = jx_y;
    self.frame = frame;
}

- (CGFloat)jx_w {
    return self.frame.size.width;
}

- (void)setJx_w:(CGFloat)jx_w {
    CGRect frame = self.frame;
    frame.size.width = jx_w;
    self.frame = frame;
}

- (CGFloat)jx_h {
    return self.frame.size.height;
}

- (void)setJx_h:(CGFloat)jx_h {
    CGRect frame = self.frame;
    frame.size.height = jx_h;
    self.frame = frame;
}

- (CGSize)jx_size {
    return self.frame.size;
}
- (void)setJx_size:(CGSize)jx_size {
    CGRect frame = self.frame;
    frame.size = jx_size;
    self.frame = frame;
}

- (CGFloat)jx_centerX {
    return self.center.x;
}
- (void)setJx_CenterX:(CGFloat)jx_centerX {
    CGPoint center = self.center;
    center.x = jx_centerX;
    self.center = center;
}

- (CGFloat)jx_centerY {
    return self.center.y;
}
- (void)setJx_centerY:(CGFloat)jx_centerY {
    CGPoint center = self.center;
    center.y = jx_centerY;
    self.center = center;
}
@end
