//
//  LeaderBoardAPI.m
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "LeaderBoardAPI.h"
#define kLeaderBoard @"http://fm.ifeng.com/fm/read/fmd/public/getLeaderboard_631.html"
@implementation LeaderBoardAPI
+ (void)requestLeaderBoard:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:@"D9B03CDCBBDDF9EDE931DF99CC1182A9" forKey:@"sign"];
    [params setObject:@"1481181692" forKey:@"timestamp"];
    BaseRequest *request = [BaseRequest requestWithURL:kLeaderBoard];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}
@end
