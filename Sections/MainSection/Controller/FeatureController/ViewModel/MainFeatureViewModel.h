//
//  MainFeatureViewModel.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainFeatureModel.h"
#import "ReactiveCocoa.h"
@interface MainFeatureViewModel : NSObject
/**
 *  更新数据的信号
 **/
@property (nonatomic, readonly) RACSignal    *updateContentSignal;
@property (nonatomic, strong)   MainFeatureModel            *featureModel;
@property (nonatomic, strong)   RecommendModel              *recommendModel;
- (void)refreshDataSource;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (CGFloat)heightForRowAtIndex:(NSIndexPath *)indexPath;
@end
