//
//  SubTitleView.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "SubTitleView.h"
#import "Masonry.h"

@interface SubTitleView()
/**
 *  滑块子视图
 */
@property (nonatomic, strong) UIView  *sliderView;

/**
 *  子标题按钮数组
 **/
@property (nonatomic, strong) NSMutableArray *subTitleButtonArray;

@property (nonatomic, strong) UIButton *currentSelectedButton;
@end

@implementation SubTitleView

-(instancetype)init
{
    if (self =[super init]) {
        self.backgroundColor =[UIColor whiteColor];
    }
    return self;
}
-(void)setTitleArray:(NSMutableArray *)titleArray
{
    _titleArray = titleArray;
    [self configSubTitles];
}
- (void)transToShowAtIndex:(NSInteger)index
{
    if(index < 0 || index >= self.subTitleButtonArray.count) {
        return;
    }
    UIButton *btn = [self.subTitleButtonArray objectAtIndex:index];
    [self selectedAtButton:btn isFirstStart:NO];
}

-(void)configSubTitles
{
    CGFloat width = screenWidthPCH / _titleArray.count;
    for (NSInteger index = 0; index < _titleArray.count; index++) {
        NSString *title = [_titleArray objectAtIndex:index];
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
    
    UIButton *firstBtn = [self.subTitleButtonArray firstObject];
    [self selectedAtButton:firstBtn isFirstStart:YES];
}
#pragma mark - action

/**
 *  选中一个按钮
 **/
- (void)selectedAtButton:(UIButton *)btn isFirstStart:(BOOL)first{
    btn.selected = YES;
    self.currentSelectedButton = btn;
    [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(btn.frame.origin.x + btn.frame.size.width / 2.0 - 15);
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
- (void)unselectedAllButton:(UIButton *)btn {
    for(UIButton *sbtn in self.subTitleButtonArray) {
        if(sbtn == btn) {
            continue;
        }
        sbtn.selected = NO;
    }
}

/**
 *  按钮点击事件回调
 */
- (void)subTitleBtnClick:(UIButton *)btn {
    if(btn == self.currentSelectedButton) {
        return;
    }
    if([self.delegate respondsToSelector:@selector(subTitleViewDidSelected:atIndex:title:)]) {
        [self.delegate subTitleViewDidSelected:self atIndex:[self.subTitleButtonArray indexOfObject:btn] title:btn.titleLabel.text];
    }
    [self selectedAtButton:btn isFirstStart:NO];
}
#pragma mark - Getter & Setter

- (NSMutableArray *)subTitleButtonArray
{
    if (!_subTitleButtonArray) {
        _subTitleButtonArray = [[NSMutableArray alloc] init];
    }
    return _subTitleButtonArray;
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
            make.size.mas_equalTo(CGSizeMake(30, 2));
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left).offset(5);
        }];
        _sliderView = view;
    }
    return _sliderView;
}
@end
