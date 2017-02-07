//
//  PlayCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/24.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramModel.h"

@interface PlayCell : UITableViewCell

@property (nonatomic, strong) PlayDetailModel *model;

+ (instancetype)playCell:(UITableView *)tableView;

@end
