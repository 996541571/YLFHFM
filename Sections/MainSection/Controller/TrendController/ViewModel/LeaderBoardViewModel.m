//
//  LeaderBoardViewModel.m
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "LeaderBoardViewModel.h"
#import "LeaderBoardAPI.h"
#import "MJExtension.h"

@implementation LeaderBoardViewModel
#pragma mark - Public
- (NSInteger)numberOfSections
{
    return 5;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        // Top100热播榜
        return 1;
    } else if (section == 1) {
        // Top100点赞榜
        return 1;
    } else if (section == 2) {
        // 订阅专辑榜
        return 1;
    } else if (section == 3) {
        // 新晋专辑榜
        return 1;
    } else {
        // 专辑精选
        return 1;
    }
}

- (CGFloat)heightForRowAtIndex:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return 270;
    } else if (indexPath.section == 2 || indexPath.section == 3) {
        return 194;
    } else {
        return 870;
    }
}
#pragma mark - Private

- (void)requestLeaderBoardWithCompletion:(void(^)())completion
{
    [LeaderBoardAPI requestLeaderBoard:^(id response, NSString *message, BOOL success) {
        if (success) {
            [LeaderBoardData mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"newsList":@"newList"
                         };
            }];
            
            [LeaderBoardData mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"praiseList":@"TopModel",
                         @"hotResourceList":@"TopModel",
                         @"subList":@"TopSubscribeModel",
                         @"newsList":@"TopSubscribeModel",
                         @"bkBdList":@"BdModel"
                         };
            }];
            
            self.model = [LeaderBoardModel mj_objectWithKeyValues:response];
        }
        
        if (completion) {
            completion();
        }
    }];
}
#pragma mark-Getter & Setter
-(RACSignal *)updateContentSignal
{
    @weakify(self);
    RACSignal *signal =[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestLeaderBoardWithCompletion:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
     return signal;
}
@end
