//
//  ProgramAPI.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/23.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "BaseAPI.h"

@interface ProgramAPI : BaseAPI

+ (void)requestProgramDetailWithPid:(NSString *)pid completion:(BaseAPICompletion)completion;

+ (void)requestPlayListWithPid:(NSString *)pid
                           rid:(NSString *)rid
                    completion:(BaseAPICompletion)completion;

@end
