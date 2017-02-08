//
//  MineHeader.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/12.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "MineHeader.h"
#import "MineIconView.h"

@interface MineHeader ()

@property (weak, nonatomic) IBOutlet UIView *iconView;

@end

@implementation MineHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addIcons];
}

- (void)addIcons
{
    CGFloat iconW = 90;
    CGFloat iconH = 90;
    CGFloat padding = (screenWidthPCH - 4 * iconW) / 2.0;
    
    MineIconView *iconView1 = [MineIconView mineIconView];
    iconView1.mineIconTitle = @"订阅";
    iconView1.mineImageName = @"category_icon";
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(padding, 0, iconW, iconH)];
    [view1 addSubview:iconView1];
    [self.iconView addSubview:view1];
    
    MineIconView *iconView2 = [MineIconView mineIconView];
    iconView2.mineIconTitle = @"下载";
    iconView2.mineImageName = @"category_icon";
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(padding + iconW, 0, iconW, iconH)];
    [view2 addSubview:iconView2];
    [self.iconView addSubview:view2];
    
    MineIconView *iconView3 = [MineIconView mineIconView];
    iconView3.mineIconTitle = @"喜欢";
    iconView3.mineImageName = @"category_icon";
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(padding + iconW * 2, 0, iconW, iconH)];
    [view3 addSubview:iconView3];
    [self.iconView addSubview:view3];
    
    MineIconView *iconView4 = [MineIconView mineIconView];
    iconView4.mineIconTitle = @"历史";
    iconView4.mineImageName = @"category_icon";
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(padding + iconW * 3, 0, iconW, iconH)];
    [view4 addSubview:iconView4];
    [self.iconView addSubview:view4];
}

+ (instancetype)mineHeader
{
    NSString *identifier = NSStringFromClass([self class]);
    return [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject;
}

@end
