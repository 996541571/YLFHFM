//
//  LeaderBoardAPI.h
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "BaseAPI.h"

@interface LeaderBoardAPI : BaseAPI
+(void)requestLeaderBoard:(BaseAPICompletion)completion;
@end
