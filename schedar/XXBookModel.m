//
//  XXBookModel.m
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXBookModel.h"

@implementation XXBookModel
- (instancetype)initWithDiction:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = [dic valueForKey:@"name"];
        self.fileUrl = [[NSBundle mainBundle]URLForResource:self.name withExtension:@"epub"];
    }
    return self;
}

+ (XXBookModel *)getModelWithDiction:(NSDictionary *)dic
{
    return [[self alloc]initWithDiction:dic];
}

+ (NSMutableArray *)bookArray
{
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    [mArray setObject:@{@"name":@"闹学记"} atIndexedSubscript:0];
    
    
    NSMutableArray *modelArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in mArray) {
        [modelArray addObject:[XXBookModel getModelWithDiction:dic]];
    }
    return modelArray;
}
@end
