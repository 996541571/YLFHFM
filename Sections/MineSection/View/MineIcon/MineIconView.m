//
//  MineIconView.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/13.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "MineIconView.h"

@interface MineIconView ()

@property (weak, nonatomic) IBOutlet UIImageView *mineImageView;

@property (weak, nonatomic) IBOutlet UILabel *mineLabel;

@end

@implementation MineIconView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)mineIconView
{
    NSString *identifier = NSStringFromClass([self class]);
    return [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.mineImageView.layer.cornerRadius = 20;
    self.mineImageView.clipsToBounds = YES;
}

- (void)setMineIconTitle:(NSString *)mineIconTitle
{
    _mineIconTitle = mineIconTitle;
    self.mineLabel.text = mineIconTitle;
}

- (void)setMineImageName:(NSString *)mineImageName
{
    _mineImageName = mineImageName;
    self.mineImageView.image = [UIImage imageNamed:mineImageName];
}

@end
