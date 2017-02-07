//
//  SubscribeCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/21.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "SubscribeCell.h"

@interface SubscribeCell ()

@end

@implementation SubscribeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)subsribeCell:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
