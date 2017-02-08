//
//  TopAlbumCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeaderBoardModel.h"

@interface TopAlbumCell : UITableViewCell

+ (instancetype)topAlbumCell:(UITableView *)tableView;

@property (nonatomic, strong) NSMutableArray<TopSubscribeModel *> *modelArray;

@end
