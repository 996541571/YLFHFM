//
//  AlbumView.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/9.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "AlbumView.h"
#import "UIImageView+YYWebImage.h"

@interface AlbumView ()

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

@property (weak, nonatomic) IBOutlet UILabel *albumLabel;

@end

@implementation AlbumView

+ (instancetype)albumView
{
    NSString *identifier = NSStringFromClass([self class]);
    return [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject;
}

- (void)setModel:(TopSubscribeModel *)model
{
    [self.albumImageView yy_setImageWithURL:[NSURL URLWithString:model.img100_100] options:YYWebImageOptionSetImageWithFadeAnimation];
    self.albumLabel.text = model.programName;
}

@end
