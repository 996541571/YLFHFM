//
//  ProgramController.m
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "ProgramController.h"
#import "ProgramHeaderView.h"
#import "ProgramViewModel.h"
#import "FunctionCell.h"
#import "PlayCell.h"
#import "AuthorCell.h"

@interface ProgramController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ProgramViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ProgramHeaderView *headerView;
@property (nonatomic, strong) NSString *pid;    // 栏目id
@end

@implementation ProgramController
- (instancetype)initWithPid:(NSString *)pid
{
    self = [super init];
    if (self) {
        _pid = pid;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
        self.headerView.imageUrlStr = self.viewModel.programModel.data.img194_194;
        self.title = self.viewModel.programModel.data.programName;
    }];
  [self.viewModel refreshDataSource];
    // Do any additional setup after loading the view.
}
#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel numberOfItemsInSection:0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.viewModel heightForRowAtIndex:indexPath];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 没有作者名字或头像，就不显示作者cell
    if (self.viewModel.programModel.data.compere.length == 0 || self.viewModel.programModel.data.headImgUrl.length == 0) {
        if (indexPath.item == 0) {
            // 功能cell，下载，排序
            FunctionCell *functionCell = [FunctionCell functionCell:tableView];
            return functionCell;
        } else {
            // 播放列表具体cell
            PlayCell *playCell = [PlayCell playCell:tableView];
            playCell.model = self.viewModel.playModel.data.resourceList[indexPath.item-1];
            return playCell;
        }
    } else {
        if (indexPath.item == 0) {
            // 作者cell
            AuthorCell *authorCell = [AuthorCell authorCell:tableView];
            authorCell.name = self.viewModel.programModel.data.compere;
            authorCell.headUrl = self.viewModel.programModel.data.headImgUrl;
            return authorCell;
        } else if (indexPath.item == 1) {
            // 功能cell，下载，排序
            FunctionCell *functionCell = [FunctionCell functionCell:tableView];
            return functionCell;
        } else {
            // 播放列表具体cell
            PlayCell *playCell = [PlayCell playCell:tableView];
            playCell.model = self.viewModel.playModel.data.resourceList[indexPath.item-2];
            return playCell;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter & Setter

- (ProgramViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[ProgramViewModel alloc] init];
        _viewModel.pid = self.pid;
    }
    return _viewModel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, screenHeightPCH) style:UITableViewStylePlain];
        tab.delegate = self;
        tab.dataSource = self;
        tab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tab.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tab.tableHeaderView = [self headerView];
        [self.view addSubview:tab];
        _tableView = tab;
    }
    return _tableView;
}

- (ProgramHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[ProgramHeaderView alloc] initWithFrame:CGRectMake(0, 0, screenHeightPCH, 250)];
    }
    
    return _headerView;
}


@end
