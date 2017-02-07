//
//  PlayCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/24.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "PlayCell.h"

@interface PlayCell ()

@property (weak, nonatomic) IBOutlet UILabel *playTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *listenNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *collectionNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;


@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;

@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@end

@implementation PlayCell

- (void)setModel:(PlayDetailModel *)model
{
    _model = model;
    self.playTitleLabel.text = model.title;
    self.listenNumLabel.text = model.listenNumShow;
    self.collectionNumLabel.text = model.collectNumShow;
    NSInteger minutes = [model.duration integerValue]/60;
    self.durationLabel.text = [NSString stringWithFormat:@"%ld分钟", minutes];
    NSInteger days = [model.updateTime integerValue]/(3600*24);
    self.updateTimeLabel.text = [NSString stringWithFormat:@"%ld天前", days];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)playCell:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
