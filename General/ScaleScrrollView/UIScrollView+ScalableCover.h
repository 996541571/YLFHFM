//
//  UIScrollView+ScalableCover.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>
static const CGFloat MaxHeight =200;
@interface ScalableCover : UIImageView
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@interface UIScrollView (ScalableCover)
@property (nonatomic, weak) ScalableCover *scalableCover;
- (void)addScalableCoverWithImage:(UIImage *)image;
- (void)removeScalableCover;
@end
