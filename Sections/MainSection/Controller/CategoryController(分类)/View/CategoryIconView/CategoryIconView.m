//
//  CategoryIconView.m
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/7.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import "CategoryIconView.h"

@interface CategoryIconView ()

@property (weak, nonatomic) IBOutlet UIImageView *categoryIconImageView;

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation CategoryIconView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)categoryIconView
{
    NSString *identifier = NSStringFromClass([self class]);
    return [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject;
}

/*
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (void)baseInit
{
    NSString *identifier = NSStringFromClass([self class]);
    UIView *view = [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject;
    //view.translatesAutoresizingMaskIntoConstraints = YES;
    [self addSubview:view];
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.categoryIconImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.categoryIconImageView.layer.cornerRadius = 21.5;
    self.categoryIconImageView.clipsToBounds = YES;
}

- (void)setCategory:(NSString *)category
{
    _category = category;
    self.categoryLabel.text = category;
}

- (void)setCategoryImageURL:(NSString *)categoryImageURL
{
    self.categoryIconImageView.image = [UIImage imageNamed:categoryImageURL];
}

@end
