//
//  XXHomeDetailViewController.m
//  schedar
//
//  Created by xiangxiong on 2017/6/1.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXHomeDetailViewController.h"



@interface XXHomeDetailViewController ()
@property (nonatomic, strong) UIScrollView *backScrollView;
@property (nonatomic, strong) UIView *headerView;
@end

@implementation XXHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.model.name;
    [self createRightBar];
    [self createScrollView];
    [self createHeaderView];
    // Do any additional setup after loading the view.
}

- (void)createRightBar
{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithTitle:@"百科" style:UIBarButtonItemStylePlain target:self action:@selector(toBaiKe)];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void)toBaiKe
{
    [self toWebView:self.model.baike];
}

- (void)toWebView:(NSString *)url
{
    XXWebViewController *web = [[XXWebViewController alloc]init];
    web.url = url;
    [self.navigationController pushViewController:web animated:YES];
}

- (void)createScrollView
{
    self.backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CDScreenWidth, CDScreenHeight)];
    [self.view addSubview:self.backScrollView];
}

- (void)createHeaderView
{
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CDScreenWidth, 120)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:self.headerView];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 96, 128)];
    imageView.image = [UIImage imageNamed:self.model.imageName];
    [self.headerView addSubview:imageView];
    CGFloat imageLabelGap = 15;
    CGFloat labelLabelGap = 10;
    CGFloat maxLabelWidth = CDScreenWidth-20-20-CGRectGetWidth(imageView.frame)-imageLabelGap;
    
    UILabel *bookNameLabel = [self allocNewLabelFontSize:18 textColor:BDColors_Important_BlueA];
    bookNameLabel.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+imageLabelGap, CGRectGetMinY(imageView.frame), maxLabelWidth, 20);
    bookNameLabel.text = self.model.name;
    [bookNameLabel sizeToFit];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toBookController)];
    bookNameLabel.userInteractionEnabled = YES;
    [bookNameLabel addGestureRecognizer:tap];
    [self.headerView addSubview:bookNameLabel];
    
    UILabel *pictureLabel = [self allocNewLabelFontSize:18 textColor:BDColors_Important_BlueA];
    pictureLabel.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+imageLabelGap, CGRectGetMaxY(bookNameLabel.frame)+labelLabelGap+10, maxLabelWidth, 10);
    pictureLabel.text = [NSString stringWithFormat:@"图册"];
    [pictureLabel sizeToFit];
    [self.headerView addSubview:pictureLabel];
    UITapGestureRecognizer *tapPicture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toPicture)];
    [pictureLabel addGestureRecognizer:tapPicture];
    pictureLabel.userInteractionEnabled = YES;
    if ([self.model.pictureUrl isEqualToString:@""] || ![self.model.pictureUrl isKindOfClass:[NSString class]]) {
        pictureLabel.hidden = YES;
    }
    
    
    UILabel *completeTimeLabel = [self allocNewLabelFontSize:14 textColor:BDColors_Important_GrayA];
    completeTimeLabel.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+imageLabelGap, CGRectGetMaxY(pictureLabel.frame)+labelLabelGap, maxLabelWidth, 10);
    completeTimeLabel.text = [NSString stringWithFormat:@"初版时间：%@",self.model.time];
    [completeTimeLabel sizeToFit];
    [self.headerView addSubview:completeTimeLabel];
    
    CGRect oldRect = self.headerView.frame;
    oldRect.size.height = CGRectGetMaxY(pictureLabel.frame)+labelLabelGap;
    self.headerView.frame = oldRect;
    
    
    UILabel *briefDefaultLabel = [self allocNewLabelFontSize:14 textColor:BDColors_Important_GrayA];
    briefDefaultLabel.frame = CGRectMake(20, CGRectGetMaxY(imageView.frame)+labelLabelGap, CDScreenWidth-40, 10);
    briefDefaultLabel.text = @"简介：";
    [briefDefaultLabel sizeToFit];
    [self.backScrollView addSubview:briefDefaultLabel];
    
    
    UILabel *briefLabel = [self allocNewLabelFontSize:14 textColor:BDColors_Important_GrayA];
    briefLabel.frame = CGRectMake(20+10, CGRectGetMaxY(briefDefaultLabel.frame)+labelLabelGap, CDScreenWidth-50, 10);
    briefLabel.text = self.model.breif;
    [briefLabel sizeToFit];
    [self.backScrollView addSubview:briefLabel];
    
    if (CGRectGetMaxY(briefLabel.frame)+64 > CDScreenHeight) {
        self.backScrollView.contentSize = CGSizeMake(CDScreenWidth, CGRectGetMaxY(briefLabel.frame)+labelLabelGap);
    }
}

- (void)toBookController
{
    LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];
    pageView.resourceURL = self.model.fileUrl;    //文件位置
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        pageView.model = [LSYReadModel getLocalModelWithURL:self.model.fileUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:pageView animated:YES completion:^{
                
            }];
        });
    });
}

- (void)toPicture
{
    [self toWebView:self.model.pictureUrl];
}

- (UILabel *)allocNewLabelFontSize:(NSInteger)font textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
