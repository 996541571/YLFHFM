//
//  FeatureCellFactory.m
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "FeatureCellFactory.h"
#import "FeatureNormalCell.h"
#import "FeatureSpecialCell.h"
@implementation FeatureCellFactory
+ (FeatureBaseCell *)createCellByFactory:(UITableView *)tableView style:(FeatureCellStyle)style
{
    FeatureBaseCell *baseCell;
    if (style == FeatureCellNormalStyle) {
        baseCell = [FeatureNormalCell featureCell:tableView];
    } else if (style == FeatureCellSpecialStyle) {
        baseCell = [FeatureSpecialCell featureCell:tableView];
    }
    
    return baseCell;
}
@end
