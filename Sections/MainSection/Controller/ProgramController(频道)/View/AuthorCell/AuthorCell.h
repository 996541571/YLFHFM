//
//  AuthorCell.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/24.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorCell : UITableViewCell

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *headUrl;

+ (instancetype)authorCell:(UITableView *)tableView;

@end
