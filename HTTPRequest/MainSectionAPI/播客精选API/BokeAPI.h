//
//  BokeAPI.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/20.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "BaseAPI.h"

@interface BokeAPI : BaseAPI

+ (void)requestRecommendWithPage:(NSInteger)page completion:(BaseAPICompletion)completion;

+ (void)requestHotWithPage:(NSInteger)page completion:(BaseAPICompletion)completion;

+ (void)requestNewWithPage:(NSInteger)page completion:(BaseAPICompletion)completion;

@end
