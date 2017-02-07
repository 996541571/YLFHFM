//
//  FeatureSpecialCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/17.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "FeatureSpecialCell.h"
#import "UIImageView+YYWebImage.h"

@interface FeatureSpecialCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@property (weak, nonatomic) IBOutlet UILabel *leftContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *rightContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *leftSubContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *rightSubContentLabel;


@end

@implementation FeatureSpecialCell

- (void)setModel:(RecommendSpecialSectionModel *)model
{
    _model = model;
    
    self.titleLabel.text = [NSString stringWithFormat:@"/ %@ /", model.cardTitle];
    
    RecommendResource *leftModel = model.listCategory.listReource[0];
    NSURL *urlLeft = [NSURL URLWithString:leftModel.img297_194];
    [self.leftImageView yy_setImageWithURL:urlLeft options:YYWebImageOptionSetImageWithFadeAnimation];
    self.leftContentLabel.text = leftModel.title;
    self.leftSubContentLabel.text = leftModel.programName;
    
    RecommendResource *rightModel = model.listCategory.listReource[1];
    NSURL *urlRight = [NSURL URLWithString:rightModel.img297_194];
    [self.rightImageView yy_setImageWithURL:urlRight options:YYWebImageOptionSetImageWithFadeAnimation];
    self.rightContentLabel.text = rightModel.title;
    self.rightSubContentLabel.text = rightModel.programName;
}

+ (FeatureBaseCell *)featureCell:(UITableView *)tableView
{
    return [self featureCellOfSpecial:tableView];
}

+ (instancetype)featureCellOfSpecial:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
