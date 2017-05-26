//
//  UIButton+JXExtension.m
//  JXButton
//
//  Created by JX.Wang on 2017/5/26.
//  Copyright © 2017年 JX.WANG. All rights reserved.
//

#import "UIButton+JXExtension.h"

@implementation UIButton (JXExtension)

- (void)jx_setButtonTtitleType:(JXCategoryTitleType)titleType {
    
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGFloat interval = 1.0;   // 自定义一个间距
    
    switch (titleType) {
        case JXCategoryTitleTypeTop:  // 文字在顶部
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(titleSize.height,0, 0, -titleSize.width)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-imageSize.height, -imageSize.width, 0, 0)];
        }
            break;
        case JXCategoryTtileTypeLeft:  // 文字在左边
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0, -titleSize.width-imageSize.width)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width-titleSize.width, 0, 0)];
        }
            break;
        case JXCategoryTitleTypeBottom:  // 文字在底部
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + interval),0, 0, -titleSize.width)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + interval, -imageSize.width, 0, 0)];
        }
            break;
        default:
            break;
    }
}

@end
