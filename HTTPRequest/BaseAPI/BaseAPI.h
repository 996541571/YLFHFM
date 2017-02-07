//
//  BaseAPI.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
typedef void(^BaseAPICompletion)(id response, NSString *message, BOOL success);
@interface BaseAPI : NSObject
+ (NSMutableDictionary *)params;
@end
