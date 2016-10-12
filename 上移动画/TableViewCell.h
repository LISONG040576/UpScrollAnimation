//
//  TableViewCell.h
//  上移动画
//
//  Created by 海尔智能-李松 on 16/9/29.
//  Copyright © 2016年 海尔智能-李松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface TableViewCell : UITableViewCell
{
    TTTAttributedLabel *tttLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                   withString:(NSString *)string;

@end
