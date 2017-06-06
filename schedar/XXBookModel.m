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
        self.imageName = [self getStringFirstLetter:self.name];
        self.breif = [dic valueForKey:@"breif"];
        self.time = [dic valueForKey:@"time"];
        self.baike = [dic valueForKey:@"baike"];
        self.pictureUrl = [dic valueForKey:@"pictureUrl"];
        
    }
    return self;
}

+ (XXBookModel *)getModelWithDiction:(NSDictionary *)dic
{
    return [[self alloc]initWithDiction:dic];
}

//获取字符串的首字母
- (NSString *)getStringFirstLetter:(NSString *)string
{
    NSString *componentLetter = @"";
    for (int i = 0; i<[string length]; i++) {
        NSString *newString = [string substringWithRange:NSMakeRange(i, 1)];
        NSMutableString *mString = [NSMutableString stringWithString:newString];
        CFStringTransform((CFMutableStringRef)mString, NULL, kCFStringTransformMandarinLatin, NO);
        CFStringTransform((CFMutableStringRef)mString, NULL, kCFStringTransformStripDiacritics, NO);
        NSString *py = [mString capitalizedString];
        componentLetter = [NSString stringWithFormat:@"%@%@",componentLetter,[py substringToIndex:1]];
    }
    return [componentLetter lowercaseString];
}

+ (NSMutableArray *)bookArray
{
    NSArray *arr = [self getBookDiction];
    NSMutableArray *modelArray = [[NSMutableArray alloc]init];
    for (int i=0; i<[arr count]; i++) {
        NSDictionary *dic = arr[i];
        [modelArray addObject:[XXBookModel getModelWithDiction:dic]];
    }
    return modelArray;
}

+ (NSArray *)getBookDiction
{
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    [mArray addObject:@{@"name":@"撒哈拉的故事",
                        @"time":@"1976年5月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E6%92%92%E5%93%88%E6%8B%89%E7%9A%84%E6%95%85%E4%BA%8B/649798/0/78310a55b319ebc4306a37ca8326cffc1e171656?fr=lemma&ct=single#aid=0&pic=78310a55b319ebc4306a37ca8326cffc1e171656",
                        @"baike":@"http://baike.baidu.com/link?url=vhZzGdiox__w7Uc9hBFBY_wmqGDhXhOmo_LdZG5C5agNWyXMZyi1WTs-tfCD1I0wIWaiG1fKIxEeOs1zUOPJo1praI-t8rq9nVIgCmCJjR6F0lkTjbhhGS8CqlBLxlTWtMFn8q4uAbtjDIKosJzbbK",
                        @"breif":@"《撒哈拉的故事》主要描写了三毛和荷西在撒哈拉沙漠生活时的所见所闻，与当地相识朋友的故事，每个故事都透露出这个隐忍女子对生活的热爱和面对困难的坚定。由十几篇精彩动人的散文结合而成，其中《沙漠中的饭店》，是三毛适应荒凉单调的沙漠生活后，重新拾笔的第一篇文章，从此之后，三毛便写出一系列以沙漠为背景的故事。三毛用自己的心去适应、关怀这片大沙漠，在她的笔下，那些撒哈拉沙漠的人和物变得丰富多彩。三毛以一个流浪者的口吻，轻松地讲述着她在撒哈拉沙漠零散的生活细节和生活经历：沙漠的新奇、生活的乐趣，千疮百孔的大帐篷、铁皮做的小屋、单峰骆驼和成群的山羊。书中无论是荷西把粉丝当做雨来吃，还是他们简单得不能再简单的婚礼、去海边打鱼、白手起家建立他们沙漠上最美丽的房子，都渗透着彼此间浓浓的温馨的爱意。"}];
    
    [mArray addObject:@{@"name":@"雨季不再来",
                        @"time":@"1976年7月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E9%9B%A8%E5%AD%A3%E4%B8%8D%E5%86%8D%E6%9D%A5/5303926/0/3b87e950352ac65ca207fbadfdf2b21192138aea?fr=lemma&ct=single#aid=0&pic=3b87e950352ac65ca207fbadfdf2b21192138aea",
                        @"baike":@"http://baike.baidu.com/link?url=TeJjDj1UcB6kFWVKiI2ex5t-a5t_i0ujQeNQKFDTVaprjZ0HXLd49SdNu-LCGfGiglbEf2HPneIX_WU3ixjEAVg4WaoBfTY6wBrCxuyGLI2FHm1OEWvSOeeRS_1pWYrK4P-9qkSS3AKq4VJd0hxxga",
                        @"breif":@"当三毛还是二毛的时候，她写下了《雨季不再来》，这些在她17~22岁之间所发表的文字，真实地呈现出从青涩敏感的二毛，蜕变为智慧成熟的三毛的成长的过程。而《雨季不再来》中透露的纯情和美感，可以清楚地印证她传奇般性格的痕迹。"}];
    
    [mArray addObject:@{@"name":@"稻草人手记",
                        @"time":@"1977年6月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E7%A8%BB%E8%8D%89%E4%BA%BA%E6%89%8B%E8%AE%B0/4375439/0/8694a4c27d1ed21b38da862cad6eddc450da3fe3?fr=lemma&ct=single#aid=0&pic=8694a4c27d1ed21b38da862cad6eddc450da3fe3",
                        @"baike":@"http://baike.baidu.com/link?url=L-BjCtPEd9qVfxDIEk7R-Gf90TS4evqJYziDfPbDc_5AqJgjel53HFH7Q4DPuyZjPyFZyNKvblDH_1zGdFHeCXXv1iPJ4xDcb_K5YDeoI9g87x-KZlKKvDdLPn7uO9Ho6qXck-ofqF_AdEHzcxnfta",
                        @"breif":@"《稻草人手记》是以三毛同名散文《稻草人手记》命名的一部散文集，包括一篇序言，十五篇散文和五封书信。作者以轻松诙谐幽默的语言记录了自己婚后的平淡琐事以及作者的感想。"}];
    
    [mArray addObject:@{@"name":@"哭泣的骆驼",
                        @"time":@"1977年8月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E5%93%AD%E6%B3%A3%E7%9A%84%E9%AA%86%E9%A9%BC/13466650/0/314e251f95cad1c871d128037d3e6709c93d51a8?fr=lemma&ct=single#aid=0&pic=314e251f95cad1c871d128037d3e6709c93d51a8",
                        @"baike":@"http://baike.baidu.com/link?url=TMbMT2jpwa-6l1L_v2Iy11JHE6CSenmVV3_MxUJxywkxfZSPGlRcxjB3iRREA700pvxOtMI3A5ZirzLAq-b2BOi7LIN7s0_ik4_uSR7z53a5rP-Wddud7CJ60f63BMNmk3pdXyQDtSY_BCprPOymy_",
                        @"breif":@"在《哭泣的骆驼》里，三毛深深眷恋着撒哈拉沙漠里的生活和周遭的人，《收魂记》、《大胡子与我》等故事情趣盎然，《沙巴军曹》等所刻画的主角给人留下了难以磨灭的印象，而压轴的《哭泣的骆驼》以游击战事为背景，细细铺写了一对沙漠情侣的生死盟……"}];
    
    [mArray addObject:@{@"name":@"温柔的夜",
                        @"time":@"1979年2月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E6%B8%A9%E6%9F%94%E7%9A%84%E5%A4%9C/1452343/0/0df431adcbef7609184cb62b29dda3cc7cd99e3a?fr=lemma&ct=single#aid=0&pic=0df431adcbef7609184cb62b29dda3cc7cd99e3a",
                        @"baike":@"http://baike.baidu.com/link?url=73Xj_lgSGn5nbyTfTfj2TMSE6NtifjJw--GhuIdco0CWUEvO012QKmYYheVNZMQlaNrPTJSpn1Ue8LA6uVbAtYopeSOhlkIJZjTv7GRWKX5W72fea4YWQn6AO60JYNW5",
                        @"breif":@"记述了三毛在加纳利群岛上的生活。\n《温柔的夜》延续了三毛一贯的写作风格，阅遍种种人情冷暖之后，溢于三毛笔端的依然是对大千世界的温柔观照，真挚动人。"}];
    
    [mArray addObject:@{@"name":@"背影",
                        @"time":@"1981年8月",
                        @"pictureUrl":@"https://baike.baidu.com/pic/%E6%B8%A9%E6%9F%94%E7%9A%84%E5%A4%9C/1452343/0/0df431adcbef7609184cb62b29dda3cc7cd99e3a?fr=lemma&ct=single#aid=0&pic=0df431adcbef7609184cb62b29dda3cc7cd99e3a",
                        @"baike":@"http://baike.baidu.com/link?url=73Xj_lgSGn5nbyTfTfj2TMSE6NtifjJw--GhuIdco0CWUEvO012QKmYYheVNZMQlaNrPTJSpn1Ue8LA6uVbAtYopeSOhlkIJZjTv7GRWKX5W72fea4YWQn6AO60JYNW5",
                        @"breif":@"记述了三毛在加纳利群岛上的生活。\n《温柔的夜》延续了三毛一贯的写作风格，阅遍种种人情冷暖之后，溢于三毛笔端的依然是对大千世界的温柔观照，真挚动人。"}];

   
//    《背影》1981年8月初版
//    
//    《梦里花落知多少》1981年8月初版
//    
//    《万水千山走遍》1982年5月初版
//    
//    《送你一匹马》1983年7月初版
//
//    
//    《倾城》1985年3月初版
//    
//    《谈心》1985年3月初版
//    
//    《随想》1985年3月初版
//    
//    《刹那时光》1986年1月初版（译）
//    
//    《三毛说书》  1987年3月初版（有声书）
//    
//    《我的宝贝》1987年7月初版
//    
//    《流星雨》1987年7月初版（有声书）
//    
//    《闹学记》1988年7月初版
    
    return mArray;
}
@end
