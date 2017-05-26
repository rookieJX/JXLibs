//
//  UIButton+JXExtension.h
//  JXButton
//
//  Created by 上海灏月 on 2017/5/26.
//  Copyright © 2017年 上海灏月. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JXCategoryTitleType) {
    JXCategoryTtileTypeLeft = 111,  // 文字在左边
    JXCategoryTitleTypeBottom,      // 文字在下方
    JXCategoryTitleTypeTop          // 文字在顶部
};

@interface UIButton (JXExtension)

- (void)jx_setButtonTtitleType:(JXCategoryTitleType)titleType;

@end
