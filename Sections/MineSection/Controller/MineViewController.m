//
//  MineViewController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeader.h"
static NSString *const kMyAttention     = @"我的关注";
static NSString *const kMyUpload        = @"我的上传";
static NSString *const kMyNews          = @"我的消息";
static NSString *const kSearchFriends   = @"找听友";

static NSString *const kAutoDownload    = @"自动下载";
static NSString *const kTimedShutdown   = @"定时关机";
static NSString *const kCar             = @"车载收听";
static NSString *const kSuggestion      = @"意见反馈";
@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UIView        *header;

@property (nonatomic, strong) MineHeader    *headerView;

@property (nonatomic, strong) UITableView   *tableView;

@property (nonatomic, strong) NSArray       *titlesArray;

@property (nonatomic, strong) NSArray       *imageArray;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    //[self.view addSubview:self.headerView];
    self.navigationItem.title = @"我的FM";
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    // Do any additional setup after loading the view.
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        CGFloat h = 170-scrollView.contentOffset.y;     // 170是图片高度，270是tableView header的高度
        self.headerView.frame = CGRectMake(0, scrollView.contentOffset.y, screenWidthPCH, -scrollView.contentOffset.y+270);
        self.headerView.headerH.constant = h;
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *subArr = self.titlesArray[section];
    return subArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *subTextArr = self.titlesArray[indexPath.section];
    NSArray *imgArr = self.imageArray[indexPath.section];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = subTextArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:imgArr[indexPath.row]];
    cell.preservesSuperviewLayoutMargins = NO;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter & Setter

- (UIView *)header
{
    if (!_header) {
        _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, 270)];
        [_header addSubview:self.headerView];
    }
    return _header;
}

- (MineHeader *)headerView
{
    if (!_headerView) {
        _headerView = [MineHeader mineHeader];
        _headerView.frame = CGRectMake(0, 0, screenWidthPCH, 270);
    }
    return _headerView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, screenHeightPCH - 64) style:UITableViewStyleGrouped];
        tab.delegate = self;
        tab.dataSource = self;
        tab.tableHeaderView = self.header;
        tab.backgroundColor = [UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:1];
        _tableView = tab;
    }
    return _tableView;
}

- (NSArray *)titlesArray
{
    if (!_titlesArray) {
        _titlesArray = @[@[kMyAttention, kMyUpload, kMyNews, kSearchFriends],
                         @[kAutoDownload, kTimedShutdown, kCar, kSuggestion]];
    }
    return _titlesArray;
}

- (NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@[@"headset-1",@"headset-1",@"headset-1",@"headset-1"],
                        @[@"headset-1",@"headset-1",@"headset-1",@"headset-1"]];
    }
    return _imageArray;
}

@end
