//
//  BaseRequest.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "BaseRequest.h"
#import "AFNetworking.h"

@interface BaseRequest()
@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) HTTPRequestCompletion completionBlock;

@property (nonatomic, strong) AFHTTPSessionManager    *sessionManager;

@end

@implementation BaseRequest
+(instancetype)requestWithURL:(NSString *)url
{
    BaseRequest *request =[[BaseRequest alloc]init];
    request.urlString =url;
    return request;
}
-(NSURLSessionDataTask *)startWithMethod:(HTTPType)methodType params:(id)params completion:(HTTPRequestCompletion)completion
{
    NSURLSessionDataTask *task = nil;
    self.completionBlock =completion;
    self.sessionManager =[self sessionManagerWithParams:params];
    if (methodType==HTTPTypeGET) {
        task =[self.sessionManager GET:[self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(self.completionBlock) {
                self.completionBlock(responseObject,nil,YES);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(self.completionBlock) {
                self.completionBlock(nil,nil,NO);
            }
        }];
    }else if(methodType == HTTPTypePOST) {
        task = [self.sessionManager POST:[self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet  characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(self.completionBlock) {
                self.completionBlock(responseObject,nil,YES);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(self.completionBlock) {
                self.completionBlock(nil,nil,NO);
            }
        }];
    }
    return nil;
    
}
- (AFHTTPSessionManager *)sessionManagerWithParams:(NSDictionary *)params {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 30.0f;
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    return sessionManager;
}
@end
