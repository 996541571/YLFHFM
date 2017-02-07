//
//  SubMainFactory.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "SubMainFactory.h"
#import "MainFeatureController.h"
#import "MainTrendController.h"
#import "MainRankController.h"
#import "MainCategoryController.h"

@implementation SubMainFactory
+ (MainBaseController *)subControllerWithIdentifier:(NSString *)identifier
{
    SubMainType type = [self typeFromTitle: identifier];
    MainBaseController *controller = nil;
    if (type == SubMainTypeFeature) {
        controller = [[MainFeatureController alloc] init];
    } else if (type == SubMainTypeTrend) {
        controller = [[MainTrendController alloc] init];
    } else if (type == SubMainTypeRank) {
        controller = [[MainRankController alloc] init];
    } else if (type == SubMainTypeCategory) {
        controller = [[MainCategoryController alloc] init];
    }
    
    return controller;
}

/**
 *  根据标题返回标识符类型
 **/
+ (SubMainType)typeFromTitle:(NSString *)title
{
    if ([title isEqualToString:@"精选"]) {
        return SubMainTypeFeature;
    } else if ([title isEqualToString:@"动态"]) {
        return SubMainTypeTrend;
    } else if ([title isEqualToString:@"榜单"]) {
        return SubMainTypeRank;
    } else if ([title isEqualToString:@"分类"]) {
        return SubMainTypeCategory;
    } else {
        return SubMainTypeUnKnown;
    }
}

@end
