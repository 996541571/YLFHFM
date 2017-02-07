//
//  ProgramHeaderView.m
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "ProgramHeaderView.h"
#import "UIImageView+YYWebImage.h"
@interface ProgramHeaderView()
@property (nonatomic, strong) UIScrollView *headerScrollView;

@property (nonatomic, strong) UILabel *subscribeLabel;

@property (nonatomic, strong) UILabel *introduceLabel;

@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end
@implementation ProgramHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.headerScrollView];
    }
    
    return self;
}

#pragma mark - UIScrollViewDelegate


#pragma mark - Getter & Setter

- (void)setImageUrlStr:(NSString *)imageUrlStr
{
    _imageUrlStr = imageUrlStr;
    [self.backgroundImageView yy_setImageWithURL:[NSURL URLWithString:imageUrlStr] options:YYWebImageOptionSetImageWithFadeAnimation];
}
- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, 250)];
    }
    return _backgroundImageView;
}

- (UIScrollView *)headerCollectionView
{
    if (!_headerScrollView) {
        _headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, 250)];
        _headerScrollView.contentSize = CGSizeMake(screenWidthPCH * 2, 0);
        _headerScrollView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.1];
        //_headerScrollView.delegate = self;
        _headerScrollView.scrollEnabled = YES;
        _headerScrollView.bounces = YES;
        _headerScrollView.pagingEnabled = YES;
    }
    
    return _headerScrollView;
}

- (UILabel *)subscribeLabel
{
    if (!_subscribeLabel) {
        _subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 50)];
        [self.headerScrollView addSubview:_subscribeLabel];
    }
    return _subscribeLabel;
}

- (UILabel *)introduceLabel
{
    if (!_introduceLabel) {
        _introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidthPCH+20, 100, 80, 50)];
        [self.headerScrollView addSubview:_introduceLabel];
    }
    return _introduceLabel;
}

@end
