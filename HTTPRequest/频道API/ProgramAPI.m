//
//  ProgramAPI.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/23.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "ProgramAPI.h"

#define kProgramAPI @"http://d.fm.ifeng.com/fm/read/fmd/ios/getProgramDetails_610.html"

#define kPlayListAPI @"http://fm.ifeng.com/fm/read/fmd/ios/getProPlayList_620.html"

@implementation ProgramAPI

+ (void)requestProgramDetailWithPid:(NSString *)pid completion:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:pid forKey:@"pid"];
    [params setObject:@"02C0ADEF852938A3199C9DAA6F5FEFDF" forKey:@"sign"];
    [params setObject:@"1479867232" forKey:@"timestamp"];
    
    BaseRequest *request = [BaseRequest requestWithURL:kProgramAPI];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}

+ (void)requestPlayListWithPid:(NSString *)pid rid:(NSString *)rid completion:(BaseAPICompletion)completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"TRWLY" forKey:@"appid"];
    [params setObject:@"20" forKey:@"num"];
    [params setObject:pid forKey:@"pid"];
    [params setObject:@"0" forKey:@"rid"];
    [params setObject:@"675E8A46A0EFBCC1C3C6BD5D5196FB4F" forKey:@"sign"];
    [params setObject:@"1479867232" forKey:@"timestamp"];
    [params setObject:@"1" forKey:@"type"];
    
    BaseRequest *request = [BaseRequest requestWithURL:kPlayListAPI];
    [request startWithMethod:HTTPTypePOST params:params completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject, message, success);
        }
    }];
}


@end
