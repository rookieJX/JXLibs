//
//  JXBaner.m
//  JXScrollView
//
//  Created by 王加祥 on 16/7/25.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXBaner.h"
#import "JXBanerCell.h"
#import "MJExtension.h"
#import "JXBanerModel.h"


@interface JXBaner()<UICollectionViewDataSource,UICollectionViewDelegate>

/** 布局 */
@property (nonatomic,weak) UICollectionViewFlowLayout * flowLayout;
/** collectionView */
@property (nonatomic,weak) UICollectionView * mainView;
/** 标识 */
@property (nonatomic,weak) UIPageControl * pageControl;
/** 模型列表 */
@property (nonatomic,strong) NSMutableArray * baners;
/** 定时器 */
@property (nonatomic,strong) NSTimer * timer;

@end


@implementation JXBaner

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置显示图片的collectionView
        [self setupMainView];
        
    }
    return self;
}

#pragma mark - 初始化操作
/**
 *  设置显示图片的collectionView
 */
- (void)setupMainView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    self.flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [mainView registerClass:[JXBanerCell class] forCellWithReuseIdentifier:@"baner"];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.pagingEnabled = YES;
    mainView.showsVerticalScrollIndicator = NO;
    mainView.showsHorizontalScrollIndicator = NO;
    [self addSubview:mainView];
    self.mainView = mainView;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [self addSubview:pageControl];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:14/255.0
                                                                green:41/255.0
                                                                 blue:71/255.0
                                                                alpha:1.0];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl = pageControl;
    
    // 开启定时器
    [self setupStartTime];
    
}

#pragma mark - 循环
- (void)cycleBaner {
    NSInteger currentIndex = self.pageControl.currentPage;
    currentIndex++;
    CGPoint point = CGPointMake(currentIndex * self.bounds.size.width, 0);
    [self.mainView setContentOffset:point animated:YES];
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    self.mainView.frame = self.bounds;
    self.flowLayout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    self.pageControl.frame = CGRectMake(self.bounds.size.width/2, self.bounds.size.height - 30, self.bounds.size.width/2, 30);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.baners.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"baner";
    JXBanerCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                   forIndexPath:indexPath];
    cell.banerModel = self.baners[indexPath.row];

    return cell;
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = scrollView.contentOffset.x / self.bounds.size.width + 0.5;
    
    if (scrollView.contentOffset.x > self.bounds.size.width * (self.banerArray.count - 1)) {
        
        self.pageControl.currentPage = 0;
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0
                                                     inSection:0];
        
        [self.mainView scrollToItemAtIndexPath:indexPath
                              atScrollPosition:UICollectionViewScrollPositionNone
                                      animated:NO];
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self setupInvalidate];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self setupStartTime];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    if ([self.delegate respondsToSelector:@selector(baner:didSelect:)]) {
        JXBanerModel * model = self.baners[indexPath.row];
        [self.delegate baner:self didSelect:model];
    }
}

#pragma mark - 定时器
/**
 *  停止定时器
 */
- (void)setupInvalidate {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setupStartTime {
    
    NSTimer * timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(cycleBaner) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)setBanerArray:(NSArray *)banerArray {
    _banerArray = banerArray;
    self.baners = [JXBanerModel mj_objectArrayWithKeyValuesArray:banerArray];
    [self.mainView reloadData];
    self.pageControl.numberOfPages = banerArray.count;
    
}

#pragma mark - 懒加载
- (NSMutableArray *)baners{
    if (_baners == nil) {
        _baners = [NSMutableArray array];
    }
    return _baners;
}

@end
