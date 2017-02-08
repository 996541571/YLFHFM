//
//  CategoryViewModel.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/7.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "CategoryViewModel.h"

@implementation CategoryViewModel

- (CGFloat)heightForCategoryOneView
{
    CGFloat iconW = 88;
    CGFloat iconH = 106;
    CGFloat padding = (screenWidthPCH - iconW * 4) / 2.0;
    return iconH * 4 + padding;
}

- (CGFloat)heightForCategoryTwoView
{
    CGFloat iconW = 88;
    CGFloat iconH = 106;
    CGFloat padding = (screenWidthPCH - iconW * 4) / 2.0;
    return iconH * 2 + padding;
}

@end
