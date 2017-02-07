//
//  MainFeatureController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainFeatureController.h"
#import "MainFeatureViewModel.h"
#import "MainFeatureHeaderView.h"
#import "FeatureCellFactory.h"
#import "FeatureSpecialCell.h"
#import "FeatureNormalCell.h"
#import "HotRecNewController.h"

#define kTableHeaderHeight   180.0
@interface MainFeatureController ()<UITableViewDelegate, UITableViewDataSource,FeatureNormalCellDelegate>
@property (nonatomic, weak)     UITableView             *tableView;
@property (nonatomic, strong)   MainFeatureViewModel    *viewModel;
@property (nonatomic, strong)   MainFeatureHeaderView   *headerView;
@property (nonatomic, strong)   UIView                  *header;
@end

@implementation MainFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
        self.headerView.model =self.viewModel.featureModel;
    }];
    [self.viewModel refreshDataSource];
      // Do any additional setup after loading the view.
}
- (void)transToHotRecNewController:(MoreType)type
{
    HotRecNewController *controller = [[HotRecNewController alloc] initWithIdentifier:type];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - FeatureNormalCellDelegate

- (void)featureNormalCellDidMoreClick:(FeatureNormalCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    switch (indexPath.item) {
        case 0:
            [self transToHotRecNewController:BokeJingxuanMore];
            break;
        case 1:
            [self transToHotRecNewController:FenghuangDujiaMore];
            break;
        default:
            break;
    }
}
#pragma mark - UITableViewDelegate & UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return [self.viewModel numberOfItemsInSection:section];;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.viewModel heightForRowAtIndex:indexPath];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0 || indexPath.item == 1 ) {
        FeatureNormalCell *normalCell = (FeatureNormalCell *)[FeatureCellFactory createCellByFactory:tableView style:FeatureCellNormalStyle];
        normalCell.delegate = self;
        normalCell.model = self.viewModel.recommendModel.data[indexPath.item];
        normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return normalCell;
    } else {
        FeatureSpecialCell *specialCell = (FeatureSpecialCell *)[FeatureCellFactory createCellByFactory:tableView style:FeatureCellSpecialStyle];
        specialCell.model = self.viewModel.recommendModel.data[indexPath.item];
        specialCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return specialCell;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter & Setter

- (MainFeatureViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[MainFeatureViewModel alloc] init];
    }
    return _viewModel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, screenHeightPCH - 64 - 40) style:UITableViewStylePlain];
        tab.delegate = self;
        tab.dataSource = self;
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        tab.tableHeaderView = [self header];
        [self.view addSubview:tab];
        _tableView = tab;
        //tab.frame = CGRectMake(0, 0, screenWidthPCH, screenHeightPCH);
        /*
         [tab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.mas_equalTo(self.view);
         }];
         */
    }
    return _tableView;
}

- (UIView *)header
{
    if (!_header) {
        _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, kTableHeaderHeight)];
         [_header addSubview:self.headerView];
    }
    return _header;
}
-(MainFeatureHeaderView *)headerView
{
    if (!_headerView) {
        _headerView =[[MainFeatureHeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidthPCH, kTableHeaderHeight)];
    _headerView.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1];
    }
    return _headerView;
}
@end
