//
//  JXBanerCell.m
//  JXScrollView
//
//  Created by 王加祥 on 16/7/25.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXBanerCell.h"
#import "JXBanerModel.h"


@interface JXBanerCell ()

/** 轮播图标题 */
@property (nonatomic,weak) UILabel * titleLabel;
/** 轮播图图片 */
@property (nonatomic,weak) UIImageView * imageView;

@end

@implementation JXBanerCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化cell内容
        [self setupCell];
    }
    return self;
}


#pragma mark - 初始化
/**
 *  初始化cell内容
 */
- (void)setupCell {
    [self imageView];
    [self titleLabel];
}

- (void)setBanerModel:(JXBanerModel *)banerModel {
    
    _banerModel = banerModel;
    
    NSURL * url = [NSURL URLWithString:banerModel.imageurl];
    [self.imageView sd_setImageWithURL:url
                      placeholderImage:[UIImage imageNamed:@"00.jpg"]];
    self.titleLabel.text = [NSString stringWithFormat:@"       %@",banerModel.navtype];
}

#pragma mark - 懒加载
- (UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithRed:14/255.0
                                               green:41/255.0
                                                blue:71/255.0
                                               alpha:1.0];
        titleLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.titleLabel.frame = CGRectMake(0, self.bounds.size.height - 30, self.bounds.size.width, 30);
}
@end
