//
//  HotRecNewSubTitle.m
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "HotRecNewSubTitle.h"
#import "Masonry.h"
@interface HotRecNewSubTitle()
@property (nonatomic, strong) UIView  *sliderView;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *subTitleButtonArray;

@property (nonatomic, strong) UIButton *currentSelectedButton;
@end

@implementation HotRecNewSubTitle
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
     self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
        [self configSubTitles];
    }
    return self;
}
-(void)configSubTitles
{
    CGFloat width = screenWidthPCH / self.titleArray.count;
    for (NSInteger index =0; index<self.titleArray.count; index++) {
        NSString *title =[self.titleArray objectAtIndex:index];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:kSystemOriginColor forState:UIControlStateSelected];
        [btn setTitleColor:kSystemBlackColor forState:UIControlStateNormal];
        [btn setTitleColor:kSystemOriginColor forState:UIControlStateHighlighted | UIControlStateSelected];
        btn.frame = CGRectMake(width * index, 0, width, 38);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.adjustsImageWhenHighlighted = NO;
        [btn addTarget:self action:@selector(subTitleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.subTitleButtonArray addObject:btn];
        [self addSubview:btn];
    }
    UIButton *firstBtn = self.subTitleButtonArray[1];
    [self selectedAtButton:firstBtn isFirstStart:YES];
}
#pragma mark - action

/**
 *  按钮点击事件回调
 */
- (void)subTitleBtnClick:(UIButton *)btn {
    if(btn == self.currentSelectedButton) {
        return;
    }
    if([self.delegate respondsToSelector:@selector(hotRecNewDidSelected:atIndex:title:)]) {
        [self.delegate hotRecNewDidSelected:self atIndex:[self.subTitleButtonArray indexOfObject:btn] title:btn.titleLabel.text];
    }
     [self selectedAtButton:btn isFirstStart:NO];
}
- (void)selectedAtButton:(UIButton *)btn isFirstStart:(BOOL)first{
    btn.selected =YES;
    self.currentSelectedButton =btn;
    [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(btn.frame.origin.x + btn.frame.size.width / 2.0 - screenWidthPCH/8.0);
    }];
    if(!first) {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        }];
    }
    [self unselectedAllButton:btn];
}
/**
 *  对所有按钮颜色执行反选操作
 */
- (void)unselectedAllButton:(UIButton *)btn{
    
    for (UIButton *sbtn in self.subTitleButtonArray) {
        if (sbtn ==btn) {
            continue;
        }
        sbtn.selected =NO;
    }
}
#pragma mark - Getter & Setter

- (NSMutableArray *)subTitleButtonArray
{
    if (!_subTitleButtonArray) {
        _subTitleButtonArray = [[NSMutableArray alloc] init];
    }
    return _subTitleButtonArray;
}

- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] init];
        [_titleArray addObject:@"热播"];
        [_titleArray addObject:@"推荐"];
        [_titleArray addObject:@"最新"];
    }
    return _titleArray;
}
/**
 *  按钮下面的标示滑块
 **/
- (UIView *)sliderView
{
    if (!_sliderView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = kSystemOriginColor;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(screenWidthPCH/4.0, 2));
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left).offset(5);
        }];
        _sliderView = view;
    }
    return _sliderView;
}
@end
