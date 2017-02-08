//
//  CategoryOneCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/7.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryViewDelegate <NSObject>

- (void)categoryIconViewSelected:(NSString *)category;

@end

@interface CategoryOneView : UIView

@property (nonatomic, weak) id <CategoryViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *categoryArray;

@end
