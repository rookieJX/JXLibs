//
//  UIView+JXExtension.h
//  JXWeiBo
//
//  Created by 王加祥 on 16/6/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  分类，快速设置尺寸

#import <UIKit/UIKit.h>

@interface UIView (JXExtension)
/** x值 */
@property (nonatomic,assign) CGFloat jx_x;
/** y值 */
@property (nonatomic,assign) CGFloat jx_y;
/** 宽度 */
@property (nonatomic,assign) CGFloat jx_w;
/** 高度 */
@property (nonatomic,assign) CGFloat jx_h;
/** 大小size */
@property (nonatomic,assign) CGSize jx_size;
/** 中心点Y值 */
@property (nonatomic,assign) CGFloat jx_centerY;
/** 中心点X值 */
@property (nonatomic,assign) CGFloat jx_centerX;
@end
