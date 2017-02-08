//
//  CategoryTwoCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/7.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "CategoryTwoView.h"
#import "CategoryIconView.h"

@implementation CategoryTwoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:239.0/255 green:238.0/255 blue:236.0/255 alpha:1];
    }
    return self;
}

- (void)setCategoryArray:(NSMutableArray *)categoryArray
{
    _categoryArray = categoryArray;
    
    CGFloat iconW = 88;
    CGFloat iconH = 106;
    CGFloat padding = (screenWidthPCH - iconW * 4) / 2.0;
    for (NSInteger i = 0; i < 2; i++) {
        for (NSInteger j = 0; j < 4; j++) {
            CGFloat x = padding + j * iconW;
            CGFloat y = padding + i * iconH;
            NSLog(@"x:%f,y:%f", x,y);
            CategoryIconView *iconView = [CategoryIconView categoryIconView];
            iconView.backgroundColor = [UIColor colorWithRed:239.0/255 green:238.0/255 blue:236.0/255 alpha:1];
            
            iconView.category = categoryArray[i * 4+j];
            iconView.categoryImageURL = [self categoryToImage:categoryArray[i*4+j]];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, iconW, iconH)];
            [view addSubview:iconView];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToCategory:)];
            [view addGestureRecognizer:tapGesture];
            [self addSubview:view];
        }
    }
}

- (void)goToCategory:(id)sender
{
    NSLog(@"123");
}

- (NSString *)categoryToImage:(NSString *)category
{
    if ([category isEqualToString:@"播客"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"有声小说"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"凤凰独家"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"读书计划"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"新闻"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"谈话"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"娱乐"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"凤凰汇"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"相声小品"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"评书曲艺"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"文史军事"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"亲子"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"情感"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"财经科技"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"电台直播"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"更多"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"搞笑"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"悬疑"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"怀旧"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"小清新"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"校园"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"励志"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"无聊"]) {
        return @"category_icon";
    } else if ([category isEqualToString:@"听觉营养"]) {
        return @"category_icon";
    } else {
        return nil;
    }
}

@end
