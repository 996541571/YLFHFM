//
//  Top100Cell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeaderBoardModel.h"

@interface Top100Cell : UITableViewCell

@property (nonatomic, strong) NSMutableArray<TopModel *> *modelArray;

+ (instancetype)top100Cell:(UITableView *)tableView;

@end
