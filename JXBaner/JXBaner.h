//
//  JXBaner.h
//  JXScrollView
//
//  Created by 王加祥 on 16/7/25.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  封装广告轮播图，点击事件等操作

#import <UIKit/UIKit.h>


@class JXBaner,JXBanerModel;

@protocol JXBanerDelegate <NSObject>

@optional

- (void)baner:(JXBaner *)baner didSelect:(JXBanerModel *)banerModel;

@end

@interface JXBaner : UIView

/** 接收图片链接数据 */
@property (nonatomic,strong) NSArray * banerArray;


/** 点击事件代理 */
@property (nonatomic,weak) id<JXBanerDelegate> delegate;

@end
