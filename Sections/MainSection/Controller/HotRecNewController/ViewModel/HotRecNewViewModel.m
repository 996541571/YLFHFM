//
//  HotRecNewViewModel.m
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "HotRecNewViewModel.h"
#import "MJExtension.h"
@interface HotRecNewViewModel ()

@property (nonatomic, assign) NSInteger recommendPageNum;

@property (nonatomic, assign) NSInteger hotPageNum;

@property (nonatomic, assign) NSInteger newPageNum;

@property (nonatomic, strong) RecommendSubscribe *recommendSubscribe;

@property (nonatomic, strong) HotSubscribe *hotSubscribe;

@property (nonatomic, strong) NewsSubscribe *newsSubscribe;

@property (nonatomic, strong) BaseAPI *api;

@end

@implementation HotRecNewViewModel
- (instancetype)initWithIdentifier:(MoreType)type
{
    self = [super init];
    if (self) {
        _type = type;
        _recommendPageNum = 1;
        _hotPageNum = 1;
        _newPageNum = 1;
    }
    
    return self;
}
/**
 *  访问推荐
 **/
- (void)requestRecommendSubscribeWithPage:(NSInteger)page completion:(void(^)())completion
{
    if (self.type == BokeJingxuanMore) {
        [BokeAPI requestRecommendWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                [RecommendSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"reList":@"RecommendSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.recommendSubscribe = [RecommendSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.reList addObjectsFromArray:self.recommendSubscribe.data.reList];
            }
            
            if (completion) {
                completion();
            }
        }];
    } else if (self.type == FenghuangDujiaMore) {
        [DujiaAPI requestRecommendWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                [RecommendSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"reList":@"RecommendSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.recommendSubscribe = [RecommendSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.reList addObjectsFromArray:self.recommendSubscribe.data.reList];
            }
            
            if (completion) {
                completion();
            }
        }];
    }
}
/**
 *  访问热门
 **/
- (void)requestHotSubscribeWithPage:(NSInteger)page completion:(void(^)())completion
{
    if (self.type == BokeJingxuanMore) {
        [BokeAPI requestHotWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                [HotSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"hotList":@"HotSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.hotSubscribe = [HotSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.hotList addObjectsFromArray:self.hotSubscribe.data.hotList];
                
                if (completion) {
                    completion();
                }
            }
        }];
    } else if (self.type == FenghuangDujiaMore) {
        [DujiaAPI requestHotWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                [HotSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"hotList":@"HotSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.hotSubscribe = [HotSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.hotList addObjectsFromArray:self.hotSubscribe.data.hotList];
                
                if (completion) {
                    completion();
                }
            }
        }];
    }
}

/**
 *  访问最新
 **/
- (void)requestNewSubscribeWithPage:(NSInteger)page completion:(void(^)())completion
{
    if (self.type == BokeJingxuanMore) {
        [BokeAPI requestNewWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                
                [NewsSubscribeListModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                    return @{
                             @"newsList":@"newList",
                             @"newsListCount":@"newListCount"
                             };
                }];
                
                [NewsSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"newsList":@"NewsSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.newsSubscribe = [NewsSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.newsList addObjectsFromArray:self.newsSubscribe.data.newsList];
                
                if (completion) {
                    completion();
                }
            }
        }];
    } else if (self.type == FenghuangDujiaMore) {
        [DujiaAPI requestNewWithPage:page completion:^(id response, NSString *message, BOOL success) {
            if (success) {
                
                [NewsSubscribeListModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                    return @{
                             @"newsList":@"newList",
                             @"newsListCount":@"newListCount"
                             };
                }];
                
                [NewsSubscribeListModel mj_setupObjectClassInArray:^NSDictionary *{
                    return @{
                             @"newsList":@"NewsSubscribeDetailModel"
                             };
                }];
                
                // 解析返回数据
                self.newsSubscribe = [NewsSubscribe mj_objectWithKeyValues:response];
                
                // 更新数据列表
                [self.newsList addObjectsFromArray:self.newsSubscribe.data.newsList];
                
                if (completion) {
                    completion();
                }
            }
        }];
    }
}
#pragma mark - **************** Setter & Getter
-(RACSignal *)updateRecommendSignal
{
    @weakify(self)
   RACSignal *signal =[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       @strongify(self);
       [self requestRecommendSubscribeWithPage:self.recommendPageNum completion:^{
           [subscriber sendNext:nil];
       }];
       return nil;
   }];
    self.recommendPageNum++;
    return signal;
}
- (RACSignal *)updateHotSignal
{
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestHotSubscribeWithPage:self.hotPageNum completion:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    self.hotPageNum++;
    return signal;
}

- (RACSignal *)updateNewSignal
{
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestNewSubscribeWithPage:self.newPageNum completion:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    self.newPageNum++;
    return signal;
}


- (NSMutableArray *)reList
{
    if (!_reList) {
        _reList = [[NSMutableArray alloc] init];
    }
    return _reList;
}

- (NSMutableArray *)hotList
{
    if (!_hotList) {
        _hotList = [[NSMutableArray alloc] init];
    }
    return _hotList;
}

- (NSMutableArray *)newsList
{
    if (!_newsList) {
        _newsList = [[NSMutableArray alloc] init];
    }
    return _newsList;
}

@end
