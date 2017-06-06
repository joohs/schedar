//
//  XXHomeViewController.m
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXHomeViewController.h"
#import "LSYReadPageViewController.h"
#import "XXBookModel.h"
#import "XXHomeTableViewCell.h"
#import "XXHomeDetailViewController.h"

static NSString *kXXHomeTableViewCell = @"XXHomeTableViewCell";

@interface XXHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation XXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"三毛作品集";
    self.dataArray = [XXBookModel bookArray];
    self.listTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    [self.view addSubview:self.listTableView];
    [self.listTableView registerClass:[XXHomeTableViewCell class] forCellReuseIdentifier:kXXHomeTableViewCell];
    self.listTableView.tableFooterView = [[UIView alloc]init];
    

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"雨季不再来" ofType:@"txt"];

    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    //判断是UNICODE编码
    
    NSString *isUNICODE = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    
    //还是ANSI编码
    
    NSString *isANSI = [[NSString alloc] initWithData:fileData encoding:-2147482062];
    
    if (isUNICODE) {
        NSString *retStr = [[NSString alloc]initWithCString:[isUNICODE UTF8String] encoding:NSUTF8StringEncoding];
        DLog(@"%@",retStr);
    }
    
    else if(isANSI){
        
        DLog(@"%@",isANSI);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kXXHomeTableViewCell forIndexPath:indexPath];
    XXBookModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell updateCellWithModel:model];
    [cell addTarget:self sel:@selector(toDetail:) tag:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XXBookModel *model = [self.dataArray objectAtIndex:indexPath.row];
    LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];
    pageView.resourceURL = model.fileUrl;    //文件位置
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        pageView.model = [LSYReadModel getLocalModelWithURL:model.fileUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:pageView animated:YES completion:^{
                
            }];
        });
    });
}

- (void)toDetail:(UITapGestureRecognizer *)tap
{
    XXBookModel *model = [self.dataArray objectAtIndex:tap.view.tag];
    XXHomeDetailViewController *detail = [[XXHomeDetailViewController alloc]init];
    detail.model = model;
    [self.navigationController pushViewController:detail animated:YES];
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
