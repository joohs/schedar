//
//  XXBookModel.h
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXBookModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL    *fileUrl;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *pictureUrl;
@property (nonatomic, strong) NSString *baike;
@property (nonatomic, strong) NSString *breif;
@property (nonatomic, strong) NSString *time;

+ (XXBookModel *)getModelWithDiction:(NSDictionary *)dic;
+ (NSMutableArray *)bookArray;
@end
