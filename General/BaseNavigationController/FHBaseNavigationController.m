//
//  FHBaseNavigationController.m
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "FHBaseNavigationController.h"

@interface FHBaseNavigationController ()

@end

@implementation FHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton =YES;
    NSDictionary *attributes =@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0f]};
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setTintColor:kNavigationBarColor];
    [[UINavigationBar appearance] setBarTintColor:kNavigationBarColor];
    
    UIImage *img = [[UIImage imageNamed:@"btn_back_n"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
