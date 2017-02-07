//
//  MainFeatureHeaderView.m
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainFeatureHeaderView.h"
#import "UIImageView+YYWebImage.h"

@interface MainFeatureHeaderView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView  *scrollView;

@property (nonatomic, strong) NSTimer       *timer;

@end
@implementation MainFeatureHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame: frame]) {
        [self addSubview:self.scrollView];
        [self addTimer];

    }
    return self;
}
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)scrollToNext
{
    if (!_model) {
        return;
    }
    NSInteger curIndex = self.scrollView.contentOffset.x / screenWidthPCH;
    [self.scrollView setContentOffset:CGPointMake((curIndex +1) * screenWidthPCH, 0) animated:YES];
}
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger curPage =self.scrollView.contentOffset.x/screenWidthPCH;
    if (curPage==self.model.data.count) {
     [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
#pragma mark - Getter & Setter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20)];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.bounces = YES;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
- (void)setModel:(MainFeatureModel *)model
{
    _model = model;
    
    for (UIView *view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    _scrollView.contentSize = CGSizeMake(screenWidthPCH * _model.data.count, 150);
    for (NSInteger index = 0; index <= _model.data.count; index++) {
        
        ActivityModel *activityModel = index == _model.data.count ? _model.data.firstObject : [_model.data objectAtIndex:index];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(screenWidthPCH * index, 0, screenWidthPCH, self.frame.size.height);
        [imageView yy_setImageWithURL:[NSURL URLWithString:activityModel.img640_292] options:YYWebImageOptionSetImageWithFadeAnimation];
        
        [_scrollView addSubview:imageView];
    }
}

@end
