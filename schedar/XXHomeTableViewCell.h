//
//  XXHomeTableViewCell.h
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXBookModel.h"

@interface XXHomeTableViewCell : UITableViewCell
- (void)updateCellWithModel:(XXBookModel *)model;
- (void)addTarget:(id)target sel:(SEL)sel tag:(NSInteger )tag;
@end
