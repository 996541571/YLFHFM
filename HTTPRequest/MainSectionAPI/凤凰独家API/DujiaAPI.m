//
//  DujiaAPI.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/23.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "DujiaAPI.h"

#define kDujiaAPI @"http://d.fm.ifeng.com/fm/read/fmd/ios/600/getProgramList.html"

@implementation DujiaAPI

+ (void)requestRecommendWithPage:(NSInteger)page completion:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:@"330" forKey:@"cid"];
    [params setObject:@"1" forKey:@"listtype"];
    [params setObject:[NSString stringWithFormat:@"%ld", (long)page] forKey:@"pagenum"];
    [params setObject:@"CD5A5060FC4429373168E4ECD2640A20" forKey:@"sign"];
    [params setObject:@"1479868531" forKey:@"timestamp"];
    
    BaseRequest *request = [BaseRequest requestWithURL:kDujiaAPI];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}

+ (void)requestHotWithPage:(NSInteger)page completion:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:@"330" forKey:@"cid"];
    [params setObject:@"3" forKey:@"listtype"];
    [params setObject:[NSString stringWithFormat:@"%ld", (long)page] forKey:@"pagenum"];
    [params setObject:@"6331D8E8A97F8B8FEE2670C51E018690" forKey:@"sign"];
    [params setObject:@"1479868633" forKey:@"timestamp"];
    
    BaseRequest *request = [BaseRequest requestWithURL:kDujiaAPI];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}

+ (void)requestNewWithPage:(NSInteger)page completion:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:@"330" forKey:@"cid"];
    [params setObject:@"2" forKey:@"listtype"];
    [params setObject:[NSString stringWithFormat:@"%ld", (long)page] forKey:@"pagenum"];
    [params setObject:@"5A9D69967AE293D2FBBAAF88D28EA7C7" forKey:@"sign"];
    [params setObject:@"1479868684" forKey:@"timestamp"];
    
    BaseRequest *request = [BaseRequest requestWithURL:kDujiaAPI];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}


@end
