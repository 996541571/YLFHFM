//
//  AlbumFeatureCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeaderBoardModel.h"

@interface AlbumFeatureCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray<BdModel *> *modelArray;

+ (instancetype)albumFeatureCell:(UITableView *)tableView;

@end
