//
//  BaseAPI.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "BaseAPI.h"

@implementation BaseAPI
+ (NSMutableDictionary *)params
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"iPhone" forKey:@"device"];
    return dic;
}
@end
