//
//  AlbumFeatureCell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "AlbumFeatureCell.h"
#import "UIImageView+YYWebImage.h"

@interface AlbumFeatureCell ()

@property (weak, nonatomic) IBOutlet UIImageView *albumOneImageView;

@property (weak, nonatomic) IBOutlet UIImageView *albumTwoImageView;

@property (weak, nonatomic) IBOutlet UIImageView *albumThreeImageView;

@property (weak, nonatomic) IBOutlet UIImageView *albumFourImageView;

@property (weak, nonatomic) IBOutlet UIImageView *albumFiveImageView;

@end

@implementation AlbumFeatureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModelArray:(NSMutableArray<BdModel *> *)modelArray
{
    _modelArray = modelArray;
    
    BdModel *model1 = modelArray[0];
    [_albumOneImageView yy_setImageWithURL:[NSURL URLWithString:model1.img1035_441] options:YYWebImageOptionSetImageWithFadeAnimation];
    
    BdModel *model2 = modelArray[1];
    [_albumTwoImageView yy_setImageWithURL:[NSURL URLWithString:model2.img1035_441] options:YYWebImageOptionSetImageWithFadeAnimation];
    
    BdModel *model3 = modelArray[2];
    [_albumThreeImageView yy_setImageWithURL:[NSURL URLWithString:model3.img1035_441] options:YYWebImageOptionSetImageWithFadeAnimation];
    
    BdModel *model4 = modelArray[3];
    [_albumFourImageView yy_setImageWithURL:[NSURL URLWithString:model4.img1035_441] options:YYWebImageOptionSetImageWithFadeAnimation];
    
    BdModel *model5 = modelArray[4];
    [_albumFiveImageView yy_setImageWithURL:[NSURL URLWithString:model5.img1035_441] options:YYWebImageOptionSetImageWithFadeAnimation];
}

+ (instancetype)albumFeatureCell:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
