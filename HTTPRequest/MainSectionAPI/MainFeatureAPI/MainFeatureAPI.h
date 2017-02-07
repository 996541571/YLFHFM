//
//  MainFeatureAPI.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "BaseAPI.h"

@interface MainFeatureAPI : BaseAPI
/**
 *  请求轮播数据
 **/
+ (void)requestFocus:(BaseAPICompletion)completion;

/**
 *  请求剩余数据
 **/
+ (void)requestRest:(BaseAPICompletion)completion;
@end
