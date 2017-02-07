//
//  MainViewController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "MainViewController.h"
#import "SubTitleView.h"
#import "Masonry.h"
#import "SubMainFactory.h"
#import "MineViewController.h"

@interface MainViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource, SubTitleViewDelegate>
@property (nonatomic, strong) SubTitleView *subTitleView;

@property (nonatomic, strong) NSMutableArray *subTitleArray;

@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSMutableArray *controllers;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"凤凰FM";
    [super viewDidLoad];
    [self configContainer];
    [self configNavigationBar];
    [self.view addSubview:self.subTitleView];
    [self configSubViews];
   
}
#pragma mark - private

- (void)configSubViews
{
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.subTitleView.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
- (void)configContainer
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
- (NSInteger)indexForViewController:(UIViewController *)controller {
    return [self.controllers indexOfObject:controller];
}

- (void)configNavigationBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [leftButton addTarget:self action:@selector(mineButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"mine"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    [rightButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Action

- (void)mineButtonClick:(UIButton *)btn
{
    MineViewController *mineVC = [[MineViewController alloc] init];
    /*
     [UIView beginAnimations:nil context:NULL];
     [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     [UIView setAnimationDuration:0.75];
     [self.navigationController pushViewController:mineVC animated:NO];
     [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
     [UIView commitAnimations];
     */
    /*
     [UIView transitionWithView:self.navigationController.view duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
     [self.navigationController pushViewController:mineVC animated:NO];
     } completion:nil];
     */
    CATransition *transition = [CATransition animation];
    transition.duration = 0.75f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.type = kCATransitionPush;
    //transition.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:mineVC animated:YES];
}

#pragma mark - SubTitleViewDelegate

- (void)subTitleViewDidSelected:(SubTitleView *)titleView atIndex:(NSInteger)index title:(NSString *)title
{
    [self.pageViewController setViewControllers:@[[self.controllers objectAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}
#pragma mark - UIPageViewControllerDelegate/UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self indexForViewController:viewController];
    if(index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.controllers objectAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self indexForViewController:viewController];
    if(index == NSNotFound || index == self.controllers.count - 1) {
        return nil;
    }
    return [self.controllers objectAtIndex:index + 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.controllers.count;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    UIViewController *viewController = self.pageViewController.viewControllers[0];
    NSUInteger index = [self indexForViewController:viewController];
    [self.subTitleView transToShowAtIndex:index];
}

#pragma mark - Getter & Setter

- (UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionSpineLocationKey];
        UIPageViewController *page = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        page.delegate = self;
        page.dataSource = self;
        [page setViewControllers:@[[self.controllers firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        [self addChildViewController:page];
        [self.view addSubview:page.view];
        _pageViewController = page;
    }
    return _pageViewController;
}

- (NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [[NSMutableArray alloc] init];
        for (NSString *title in self.subTitleArray) {
            MainBaseController *con = [SubMainFactory subControllerWithIdentifier:title];
            [_controllers addObject:con];
        }
    }
    
    return _controllers;
}

/**
 *  子标题
 **/
- (SubTitleView *)subTitleView
{
    if (!_subTitleView) {
        _subTitleView = [[SubTitleView alloc] initWithFrame:CGRectMake(0, 0, screenWidthPCH, 40)];
        _subTitleView.delegate = self;
        /*
         [_subTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.size.mas_equalTo(CGSizeMake(screenWidthPCH, 40));
         make.top.mas_equalTo(self.view.mas_top);
         make.left.mas_equalTo(self.view.mas_left);
         make.right.mas_equalTo(self.view.mas_right);
         }];
         */
        
        _subTitleView.titleArray = self.subTitleArray;
    }
    return _subTitleView;
}

/**
 *  分类标题数组
 */
- (NSMutableArray *)subTitleArray {
    if(!_subTitleArray) {
        _subTitleArray = [[NSMutableArray alloc] initWithObjects:@"精选",@"动态",@"榜单",@"分类",nil];
    }
    return _subTitleArray;
}

@end
