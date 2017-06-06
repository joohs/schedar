//
//  XXHomeTableViewCell.m
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXHomeTableViewCell.h"


@interface XXHomeTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *breifLabel;
@end

@implementation XXHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 78, 110)];
        [self.contentView addSubview:self.iconImageView];
        self.nameLabel = [self getLabelFont:18 textColor:BDColors_Important_BlueA];
        [self.contentView addSubview:self.nameLabel];
        self.breifLabel = [self getLabelFont:14 textColor:BDColors_Important_GrayB];
        [self.contentView addSubview:self.breifLabel];
    }
    return self;
}

- (void)updateCellWithModel:(XXBookModel *)model
{
    CGFloat leftGap = 15;
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width-78-10-10-15;
    NSString *tureImageName = [NSString stringWithFormat:@"%@",model.imageName];
    self.iconImageView.image = [UIImage imageNamed:tureImageName];
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+leftGap, leftGap, maxWidth, 10);
    self.nameLabel.text = model.name;
    [self.nameLabel sizeToFit];
    self.breifLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+leftGap, maxWidth, 10);
    self.breifLabel.text = [NSString stringWithFormat:@"简介：\n%@",model.breif];
    [self.breifLabel sizeToFit];
}

- (UILabel *)getLabelFont:(NSInteger)font textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 4;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

- (void)addTarget:(id)target sel:(SEL)sel tag:(NSInteger )tag
{
    self.nameLabel.userInteractionEnabled = YES;
    self.nameLabel.tag = tag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
    [self.nameLabel addGestureRecognizer:tap];
}

@end
