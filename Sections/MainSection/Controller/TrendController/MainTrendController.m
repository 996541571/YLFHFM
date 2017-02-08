//
//  MainTrendController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainTrendController.h"
#import "Top100Cell.h"
#import "TopAlbumCell.h"
#import "AlbumFeatureCell.h"
#import "LeaderBoardViewModel.h"
@interface MainTrendController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LeaderBoardViewModel *viewModel;

@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MainTrendController

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    [self.viewModel.updateContentSignal  subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma makr - UITableViewDelegate & UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel numberOfItemsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.viewModel heightForRowAtIndex:indexPath];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        // top100热播榜
        Top100Cell *top100Cell = [Top100Cell top100Cell:tableView];
        top100Cell.modelArray = self.viewModel.model.data.hotResourceList;
        top100Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return top100Cell;
    } else if (indexPath.section == 1) {
        // top100点赞榜
        Top100Cell *top100Cell = [Top100Cell top100Cell:tableView];
        top100Cell.modelArray = self.viewModel.model.data.praiseList;
        top100Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return top100Cell;
    } else if (indexPath.section == 2) {
        // 订阅专辑榜
        TopAlbumCell *topAlbumCell = [TopAlbumCell topAlbumCell:tableView];
        topAlbumCell.modelArray = self.viewModel.model.data.subList;
        topAlbumCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return topAlbumCell;
    } else if (indexPath.section == 3) {
        // 新晋专辑榜
        TopAlbumCell *topAlbumCell = [TopAlbumCell topAlbumCell:tableView];
        topAlbumCell.modelArray = self.viewModel.model.data.newsList;
        topAlbumCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return topAlbumCell;
    } else {
        // 专辑精选
        AlbumFeatureCell *albumFeatureCell = [AlbumFeatureCell albumFeatureCell:tableView];
        albumFeatureCell.modelArray = self.viewModel.model.data.bkBdList;
        albumFeatureCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return albumFeatureCell;
    }
}

#pragma mark - Getter & Setter
- (LeaderBoardViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[LeaderBoardViewModel alloc] init];
    }
    return _viewModel;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidthPCH, screenHeightPCH-64-40) style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView =tableView;
    }
    return _tableView;
}

@end
