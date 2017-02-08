//
//  MainCategoryController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainCategoryController.h"
#import "CategoryViewModel.h"
#import "CategoryOneView.h"
#import "CategoryTwoView.h"
#import "HotRecNewController.h"
@interface MainCategoryController ()<CategoryViewDelegate>
@property (nonatomic, strong) CategoryViewModel *viewModel;

@property (nonatomic, strong) NSMutableArray *categoryOneArray;

@property (nonatomic, strong) NSMutableArray *categoryTwoArray;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CategoryOneView *categoryOneView;

@property (nonatomic, strong) CategoryTwoView *categoryTwoView;
@end

@implementation MainCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)transToHotRecNewController:(MoreType)type
{
    HotRecNewController *controller = [[HotRecNewController alloc] initWithIdentifier:type];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - CategoryViewDelegate

- (void)categoryIconViewSelected:(NSString *)category
{
    if ([category isEqualToString:@"播客"]) {
        [self transToHotRecNewController:BokeJingxuanMore];
    } else if ([category isEqualToString:@"凤凰独家"]) {
        [self transToHotRecNewController:FenghuangDujiaMore];
    }
}
#pragma mark - Getter & Setter

- (CategoryViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[CategoryViewModel alloc] init];
    }
    return _viewModel;
}
- (CategoryOneView *)categoryOneView
{
    if (!_categoryOneView) {
        CategoryOneView *categoryOneView = [[CategoryOneView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, [self.viewModel heightForCategoryOneView])];
        categoryOneView.categoryArray = self.categoryOneArray;
        categoryOneView.backgroundColor = [UIColor whiteColor];
        categoryOneView.delegate = self;
        _categoryOneView = categoryOneView;
    }
    return _categoryOneView;
}

- (CategoryTwoView *)categoryTwoView
{
    if (!_categoryTwoView) {
        CategoryTwoView *categoryTwoView = [[CategoryTwoView alloc] initWithFrame:CGRectMake(0, [self.viewModel heightForCategoryOneView], screenWidthPCH, [self.viewModel heightForCategoryTwoView])];
        categoryTwoView.categoryArray = self.categoryTwoArray;
        _categoryTwoView = categoryTwoView;
    }
    return _categoryTwoView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, screenHeightPCH - 64 - 40)];
        CGFloat h = [self.viewModel heightForCategoryOneView] + [self.viewModel heightForCategoryTwoView];
        scrollView.contentSize = CGSizeMake(0, h);
        [scrollView addSubview:self.categoryOneView];
        [scrollView addSubview:self.categoryTwoView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

/**
 *  分类标题数组1
 **/
- (NSMutableArray *)categoryOneArray
{
    if (!_categoryOneArray) {
        _categoryOneArray = [[NSMutableArray alloc] initWithObjects:@"播客", @"有声小说", @"凤凰独家", @"读书计划",@"新闻",@"谈话",@"娱乐",@"凤凰汇",@"相声小品",@"评书曲艺",@"文史军事",@"亲子",@"情感",@"财经科技",@"电台直播",@"更多",nil];
    }
    return _categoryOneArray;
}

/**
 *  分类标题数组2
 **/
- (NSMutableArray *)categoryTwoArray
{
    if (!_categoryTwoArray) {
        _categoryTwoArray = [[NSMutableArray alloc] initWithObjects:@"搞笑",@"悬疑",@"怀旧",@"小清新",@"校园",@"励志",@"无聊",@"听觉营养", nil];
    }
    return _categoryTwoArray;
}


@end
