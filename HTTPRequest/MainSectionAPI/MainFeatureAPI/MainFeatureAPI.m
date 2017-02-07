//
//  MainFeatureAPI.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainFeatureAPI.h"
#define kFocusAPI   @"http://d.fm.ifeng.com/fm/read/fmd/public/getBanner_633.html"

#define kRestAPI    @"http://d.fm.ifeng.com/fm/read/fmd/ios/getCardById_634.html?appid=TRWLY&cid=%5B%7Bid%3A64%7D%2C%7Bid%3A72%7D%2C%7Bid%3A81%7D%2C%7Bid%3A69%7D%2C%7Bid%3A93%7D%2C%7Bid%3A113%7D%2C%7Bid%3A111%7D%2C%7Bid%3A38%7D%2C%7Bid%3A65%7D%2C%7Bid%3A37%7D%2C%7Bid%3A100%7D%2C%7Bid%3A103%7D%2C%7Bid%3A105%7D%2C%7Bid%3A60%7D%2C%7Bid%3A88%7D%5D&sign=0704D5FB1F45B23E2CBD669ABFB6263D&timestamp=1479200461"
@implementation MainFeatureAPI
+(void)requestFocus:(BaseAPICompletion)completion
{
    BaseRequest *request = [BaseRequest requestWithURL:kFocusAPI];
    [request startWithMethod:HTTPTypeGET params:nil completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject,message,success);
        }
    }];
}
+ (void)requestRest:(BaseAPICompletion)completion
{
    BaseRequest *request = [BaseRequest requestWithURL:kRestAPI];
    [request startWithMethod:HTTPTypePOST params:nil completion:^(id responseObject, NSString *message, BOOL success) {
        if (completion) {
            completion(responseObject,message,success);
        }
    }];
}
@end
