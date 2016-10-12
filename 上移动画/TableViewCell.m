//
//  TableViewCell.m
//  上移动画
//
//  Created by 海尔智能-李松 on 16/9/29.
//  Copyright © 2016年 海尔智能-李松. All rights reserved.
//

#import "TableViewCell.h"


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withString:(NSString *)string{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSubviewWithString:string];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.contentView.frame];
    }
    
    return self;
    
    
    
}

- (void)_initSubviewWithString:(NSString *)string{
    
    NSString *str = string;
    //创建tttLabel
    tttLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(10 , 0, 375 - 20, 0)];
//    tttLabel.backgroundColor = [UIColor orangeColor];
    tttLabel.lineBreakMode = NSLineBreakByCharWrapping;
    tttLabel.lineSpacing = 6;//设置行间距tttLabel.font = [UIFont systemFontOfSize:12];
    tttLabel.numberOfLines = 0; //设置行数为0
    tttLabel.font = [UIFont fontWithName:@"Lao Sangam MN" size:14];
    
    tttLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:tttLabel];//获取tttLabel的高度//先通过NSMutableAttributedString设置和上面tttLabel一样的属性,例如行间距,字体
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];//自定义str和TTTAttributedLabel一样的行间距
    NSMutableParagraphStyle *paragrapStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrapStyle setLineSpacing:6];//设置行间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragrapStyle range:NSMakeRange(0, str.length)];
    //设置字体
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Lao Sangam MN" size:14] range:NSMakeRange(0, str.length)];
    //得到自定义行间距的UILabel的高度
    //CGSizeMake(300,MAXFLOAt)中的300,代表是UILable控件的宽度,它和初始化TTTAttributedLabel的宽度是一样的.
    CGFloat height = [TTTAttributedLabel sizeThatFitsAttributedString:attrString withConstraints:CGSizeMake(375 - 20, MAXFLOAT) limitedToNumberOfLines:0].height;
    //重新改变tttLabel的frame高度
    CGRect rect = tttLabel.frame;
    rect.size.height = height;
    tttLabel.frame = rect;
    
    [tttLabel setText:str];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
