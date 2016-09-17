//
//  JXSearchBar.m
//  JXWeiBo
//
//  Created by yuezuo on 16/6/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSearchBar.h"

@interface JXSearchBar ()


/** 图片名称 */
@property (nonatomic,strong) UIImageView * iconImageView;

@end


@implementation JXSearchBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 设置背景
        self.background = [UIImage resizedImage:@"personal_account_bg"];
        
        // 设置内容垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        // 设置左边显示一个放大镜
        UIImageView * leftView = [[UIImageView alloc] init];
        leftView.image = [UIImage resizedImage:@"personal_pwd"];
        leftView.w = leftView.image.size.width + 10;
        leftView.h = leftView.image.size.height;
        self.iconImageView = leftView;
        
        // 设置leftView的内容居中
        leftView.contentMode = UIViewContentModeCenter;
        // 设置UITextField的左边图片永远显示
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = leftView;
        
        // 设置右边永远显示清楚按钮
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

+ (instancetype)searchBar {
    
    return [[self alloc] init];
}

- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    self.iconImageView.image = [UIImage resizedImage:iconName];
//    self.iconImageView.w = self.iconImageView.image.size.width + 10;
//    self.iconImageView.h = self.iconImageView.image.size.height;
}
@end
