//
//  Top100Cell.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "Top100Cell.h"
#import "UIImageView+YYWebImage.h"

@interface Top100Cell ()

@property (weak, nonatomic) IBOutlet UIImageView *contentOneImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentOneTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentOneSubTitle;

@property (weak, nonatomic) IBOutlet UIImageView *contentTwoImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentTwoTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentTwoSubTitle;

@property (weak, nonatomic) IBOutlet UIImageView *contentThreeImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentThreeTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentThreeSubTitle;


@end

@implementation Top100Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModelArray:(NSMutableArray<TopModel *> *)modelArray
{
    _modelArray = modelArray;
    
    if (modelArray.count != 3) {
        return;
    }
    
    TopModel *modelOne = modelArray[0];
    [self.contentOneImageView yy_setImageWithURL:[NSURL URLWithString:modelOne.img100_100] options:YYWebImageOptionSetImageWithFadeAnimation];
    self.contentOneTitle.text = modelOne.title;
    self.contentOneSubTitle.text = modelOne.programName;
    
    TopModel *modelTwo = modelArray[1];
    [self.contentTwoImageView yy_setImageWithURL:[NSURL URLWithString:modelTwo.img100_100] options:YYWebImageOptionSetImageWithFadeAnimation];
    self.contentTwoTitle.text = modelTwo.title;
    self.contentTwoSubTitle.text = modelTwo.programName;
    
    TopModel *modelThree = modelArray[2];
    [self.contentThreeImageView yy_setImageWithURL:[NSURL URLWithString:modelThree.img100_100] options:YYWebImageOptionSetImageWithFadeAnimation];
    self.contentThreeTitle.text = modelThree.title;
    self.contentThreeSubTitle.text = modelThree.programName;
}

+ (instancetype)top100Cell:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
