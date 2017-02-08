//
//  LeaderBoardViewModel.h
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
#import "LeaderBoardModel.h"

@interface LeaderBoardViewModel : NSObject
@property(nonatomic,readonly)RACSignal*updateContentSignal;
@property (nonatomic, strong) LeaderBoardModel *model;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (CGFloat)heightForRowAtIndex:(NSIndexPath *)indexPath;
@end
