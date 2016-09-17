//
//  JXBanerCell.h
//  JXScrollView
//
//  Created by 王加祥 on 16/7/25.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JXBanerModel;

@interface JXBanerCell : UICollectionViewCell
/** 接收数据模型 */
@property (nonatomic,strong) JXBanerModel * banerModel;

@end
