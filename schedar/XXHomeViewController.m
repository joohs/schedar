//
//  XXHomeViewController.m
//  schedar
//
//  Created by xiangxiong on 2017/5/31.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXHomeViewController.h"
#import "XXReaderPageViewController.h"
#import "XXBookModel.h"
#import "XXHomeTableViewCell.h"

static NSString *kXXHomeTableViewCell = @"XXHomeTableViewCell";

@interface XXHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation XXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    self.dataArray = [XXBookModel bookArray];
    self.listTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    [self.view addSubview:self.listTableView];
    [self.listTableView registerClass:[XXHomeTableViewCell class] forCellReuseIdentifier:kXXHomeTableViewCell];
    
    

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
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kXXHomeTableViewCell forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXBookModel *model = [self.dataArray objectAtIndex:indexPath.row];
    XXReaderPageViewController *controller = [[XXReaderPageViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
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
