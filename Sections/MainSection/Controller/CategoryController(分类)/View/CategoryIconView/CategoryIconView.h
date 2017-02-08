//
//  CategoryIconView.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/7.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryIconView : UIView

+ (instancetype)categoryIconView;

@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSString *categoryImageURL;

@end
