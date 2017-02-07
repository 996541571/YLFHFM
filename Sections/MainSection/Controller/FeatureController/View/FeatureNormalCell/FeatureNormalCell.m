//
//  FeatureNormalCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/16.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "FeatureNormalCell.h"
#import "UIImageView+YYWebImage.h"

@interface FeatureNormalCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageViewLeft;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageViewMiddle;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageViewRight;
@property (weak, nonatomic) IBOutlet UILabel *contentLeft;
@property (weak, nonatomic) IBOutlet UILabel *contentMiddle;
@property (weak, nonatomic) IBOutlet UILabel *contentRight;
@property (weak, nonatomic) IBOutlet UILabel *subContentLeft;
@property (weak, nonatomic) IBOutlet UILabel *subContentMiddle;
@property (weak, nonatomic) IBOutlet UILabel *subContentRight;

/*
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *moreButton;
@property (strong, nonatomic) UIImageView *iconImageViewLeft;
@property (strong, nonatomic) UIImageView *iconImageViewMiddle;
@property (strong, nonatomic) UIImageView *iconImageViewRight;
@property (strong, nonatomic) UILabel *contentLeft;
@property (strong, nonatomic) UILabel *contentMiddle;
@property (strong, nonatomic) UILabel *contentRight;
@property (strong, nonatomic) UILabel *subContentLeft;
@property (strong, nonatomic) UILabel *subContentMiddle;
@property (strong, nonatomic) UILabel *subContentRight;
*/

@end

@implementation FeatureNormalCell

/*
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, screenWidthPCH, 20)];
        [self.contentView addSubview:_titleLabel];
        
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidthPCH - 10 - 50, 10, 50, 50)];
        [_moreButton addTarget:self action:@selector(showMoreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_moreButton];
        
        _iconImageViewLeft = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageViewLeft];
        
        _iconImageViewMiddle = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageViewMiddle];
        
        _iconImageViewRight = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageViewRight];
        
        _contentLeft = [[UILabel alloc] init];
        [self.contentView addSubview:_contentLeft];
        
        _contentMiddle = [[UILabel alloc] init];
        [self.contentView addSubview:_contentMiddle];
        
        _contentRight = [[UILabel alloc] init];
        [self.contentView addSubview:_contentRight];
        
        _subContentLeft = [[UILabel alloc] init];
        [self.contentView addSubview:_subContentLeft];
        
        _subContentMiddle = [[UILabel alloc] init];
        [self.contentView addSubview:_subContentMiddle];
        
        _subContentRight = [[UILabel alloc] init];
        [self.contentView addSubview:_subContentRight];
    }
    return self;
}
*/
 
- (void)setModel:(RecommendSpecialSectionModel *)model
{
    _model = model;
    
    self.titleLabel.text = [NSString stringWithFormat:@"/ %@ /", model.cardTitle];
    [self setDetailsWithDetailsArray:model.listCategory.listReource];
}

- (void)setDetailsWithDetailsArray:(NSMutableArray<RecommendResource *> *)array
{
    for (NSInteger index = 0; index < array.count; index++) {
        RecommendResource *model = [array objectAtIndex:index];
        NSURL *url = [NSURL URLWithString:model.img194_194];
        if (index == 0) {
            [self.iconImageViewLeft yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
            self.contentLeft.text = model.reTitle;
            self.subContentLeft.text = model.programName;
        } else if (index == 1) {
            [self.iconImageViewMiddle yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
            self.contentMiddle.text = model.reTitle;
            self.subContentMiddle.text = model.programName;
        } else if (index == 2) {
            [self.iconImageViewRight yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
            self.contentRight.text = model.reTitle;
            self.subContentRight.text = model.programName;
        }
    }
}


- (IBAction)showMoreButtonClick:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(featureNormalCellDidMoreClick:)]) {
        [self.delegate featureNormalCellDidMoreClick:self];
    }
}

+ (FeatureBaseCell *)featureCell:(UITableView *)tableView
{
    return [self featureCellOfNormal:tableView];
}

+ (instancetype)featureCellOfNormal:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

/*
+ (instancetype)featureCellOfNormal:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}
*/

@end
