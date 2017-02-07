//
//  HotRecNewSubTitle.h
//  YLFHFM
//
//  Created by LYL on 2017/2/6.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotRecNewSubTitle;

@protocol HotRecNewSubTitleDelegate <NSObject>

- (void)hotRecNewDidSelected:(HotRecNewSubTitle *)titleView atIndex:(NSInteger)index title:(NSString *)title;

@end
@interface HotRecNewSubTitle : UIView
@property (nonatomic, weak) id <HotRecNewSubTitleDelegate> delegate;
@end
