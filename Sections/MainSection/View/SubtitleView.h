//
//  SubTitleView.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SubTitleView;

@protocol SubTitleViewDelegate <NSObject>

- (void)subTitleViewDidSelected:(SubTitleView *)titleView atIndex:(NSInteger)index title:(NSString *)title;

@end
@interface SubTitleView : UIView

@property (nonatomic, weak) id <SubTitleViewDelegate> delegate;
/**
 *  标题数据源
 **/
@property (nonatomic, strong) NSMutableArray *titleArray;

/**
 *  切换到子视图中
 **/
- (void)transToShowAtIndex:(NSInteger)index;
@end
