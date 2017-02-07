//
//  FeatureNormalCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/16.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "FeatureBaseCell.h"
#import "MainFeatureModel.h"

@class FeatureNormalCell;

@protocol FeatureNormalCellDelegate <NSObject>

/**
 *  更多按钮点击事件
 **/
- (void)featureNormalCellDidMoreClick:(FeatureNormalCell *)cell;

@end

@interface FeatureNormalCell : FeatureBaseCell

+ (instancetype)featureCell:(UITableView *)tableView;

@property (nonatomic, weak) id <FeatureNormalCellDelegate> delegate;

@property (nonatomic, strong) RecommendSpecialSectionModel *model;

//@property (nonatomic, strong) RecommendResource *recommendResource;

@end
