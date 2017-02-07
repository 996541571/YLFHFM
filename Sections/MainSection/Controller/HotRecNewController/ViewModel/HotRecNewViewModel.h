//
//  HotRecNewViewModel.h
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
#import "BaseAPI.h"
#import "BokeAPI.h"
#import "DujiaAPI.h"
#import "SubscribeModel.h"
typedef NS_ENUM(NSInteger, MoreType) {
    BokeJingxuanMore    =   0,
    FenghuangDujiaMore  =   1,
};
@interface HotRecNewViewModel : NSObject

@property (nonatomic, assign) MoreType type;
/**
 *  推荐列表
 **/
@property (nonatomic, strong) NSMutableArray *reList;

/**
 *  热门列表
 **/
@property (nonatomic, strong) NSMutableArray *hotList;

/**
 *  最新列表
 **/
@property (nonatomic, strong) NSMutableArray *newsList;
/**
 *  更新推荐数据信号
 **/
@property (nonatomic, readonly) RACSignal *updateRecommendSignal;

/**
 *  更新热门数据信号
 **/
@property (nonatomic, readonly) RACSignal *updateHotSignal;

/**
 *  更新最新数据信号
 **/
@property (nonatomic, readonly) RACSignal *updateNewSignal;

/**
 *  type：播客精选/小品之类的类型
 **/
- (instancetype)initWithIdentifier:(MoreType)type;


@end
