//
//  MainFeatureViewModel.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainFeatureViewModel.h"
#import "MainFeatureAPI.h"
#import "MJExtension.h"
#define kMainFeatureUpdateSignalName @"MainFeatureUpdateContentSignal"

#define kSectionHeight        250.0
@interface MainFeatureViewModel ()

@property (nonatomic, strong) RACSubject *updateContentSignal;

@end
@implementation MainFeatureViewModel
-(instancetype)init
{
    if (self =[super init]) {
        self.updateContentSignal =[[RACSubject subject] setNameWithFormat:kMainFeatureUpdateSignalName];
    }
    return self;
}
#pragma mark - public

- (void)refreshDataSource
{
    @weakify(self);
    RACSignal *signalFocus =[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestFocusList:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
    RACSignal *signalRest = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestRest:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
    [[RACSignal combineLatest:@[signalFocus,signalRest]] subscribeNext:^(id x) {
        @strongify(self);
        [(RACSubject *)self.updateContentSignal sendNext:nil];
    }];

}
- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return self.recommendModel.data.count;
}


- (CGFloat)heightForRowAtIndex:(NSIndexPath *)indexPath {
    return kSectionHeight;
}

#pragma mark - NetRequest

/**
 *  请求轮播数据
 **/
- (void)requestFocusList:(void(^)())completion
{
    [MainFeatureAPI requestFocus:^(id response, NSString *message, BOOL success) {
        if (success) {
            [MainFeatureModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"data":@"ActivityModel"
                         };
            }];
            
            [ActivityModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"audiolist":@"Audio"
                         };
            }];
            self.featureModel = [MainFeatureModel mj_objectWithKeyValues:response];
        }
        
        if (completion) {
            completion();
        }
    }];
}
/**
 *  请求剩下的数据
 **/
- (void)requestRest:(void(^)())completion
{
    [MainFeatureAPI requestRest:^(id response, NSString *message, BOOL success) {
        if (success) {
            
            /*
             [RecommendModel mj_setupObjectClassInArray:^NSDictionary *{
             return @{
             @"data":@"RecommendSectionModel"
             };
             }];
             
             [RecommendSectionModel mj_setupObjectClassInArray:^NSDictionary *{
             return @{
             @"listReource":@"RecommendResource"
             };
             }];
             
             [RecommendResource mj_setupObjectClassInArray:^NSDictionary *{
             return @{
             @"audiolist":@"RecommendAudio"
             };
             }];
             */
            [RecommendSectionModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"listReource":@"RecommendResource"
                         };
            }];
            
            [RecommendSectionModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"listReource":@"RecommendResource"
                         };
            }];
            
            [RecommendResource mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"audiolist":@"RecommendAudio"
                         };
            }];
            
            [RecommendSectionModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"listReource":@"listTwy"
                         };
            }];
            
            [ListCategory mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"listReource":@"RecommendResource"
                         };
            }];
            
            self.recommendModel = [[RecommendModel alloc] init];
            self.recommendModel.data = [[NSMutableArray alloc] init];
            NSMutableArray *data = response[@"data"];
            for (NSInteger index = 0; index < data.count; index++) {
                if (index == 0 || index == 4 ) {
                    //RecommendSectionModel *sectionModel = [RecommendSectionModel mj_objectWithKeyValues:data[index]];
                    //[self.recommendModel.data addObject:sectionModel];
                    
                } else if (index == 6) {
                    //RecommendSectionModel *sectionModel = [RecommendSectionModel mj_objectWithKeyValues:data[index]];
                    //[self.recommendModel.data addObject:sectionModel];
                    
                } else if (index == 5) {
                    // Do nothing
                    //[self.recommendModel.data addObject:@"advertisement"];
                    
                } else if (index == 2) {
                    // 专题
                } else {
                    RecommendSpecialSectionModel *sectionModel = [RecommendSpecialSectionModel mj_objectWithKeyValues:data[index]];
                    [self.recommendModel.data addObject:sectionModel];
                }
            }
            
            NSLog(@"123");
        }
        
        if (completion) {
            completion();
        }
    }];
}

@end
