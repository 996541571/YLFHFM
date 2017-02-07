//
//  SubscribeCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/21.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubscribeModel.h"

@interface SubscribeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *subscribBtn;

+ (instancetype)subsribeCell:(UITableView *)tableView;

@end
