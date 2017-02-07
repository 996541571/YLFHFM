//
//  FeatureSpecialCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/17.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "FeatureBaseCell.h"
#import "MainFeatureModel.h"

@interface FeatureSpecialCell : FeatureBaseCell

+ (instancetype)featureCell:(UITableView *)tableView;

@property (nonatomic, strong) RecommendSpecialSectionModel *model;

@end
