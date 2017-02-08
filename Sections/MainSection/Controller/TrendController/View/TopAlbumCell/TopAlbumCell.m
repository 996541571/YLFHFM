//
//  TopAlbumCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "TopAlbumCell.h"
#import "AlbumView.h"

@interface TopAlbumCell ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation TopAlbumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModelArray:(NSMutableArray<TopSubscribeModel *> *)modelArray
{
    _modelArray = modelArray;
    
    //[self.scrollView removeAllSubViews];
    
    self.scrollView.contentSize = CGSizeMake(100 * modelArray.count, 0);
    
    for (NSInteger index = 0; index < modelArray.count; index++) {
        TopSubscribeModel *model = [modelArray objectAtIndex:index];
        AlbumView *albumView = [AlbumView albumView];
        albumView.model = model;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100 * index, 0, 100, 130)];
        [view addSubview:albumView];
        [self.scrollView addSubview:view];
    }
}

+ (instancetype)topAlbumCell:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
