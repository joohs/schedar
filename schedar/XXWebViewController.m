//
//  XXWebViewController.m
//  schedar
//
//  Created by xiangxiong on 2017/6/1.
//  Copyright © 2017年 xiangxiong. All rights reserved.
//

#import "XXWebViewController.h"
#import <WebKit/WebKit.h>

@interface XXWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkView;
@end

@implementation XXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wkView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.wkView];
    self.wkView.navigationDelegate = self;
    [self.wkView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    // Do any additional setup after loading the view.
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.title = webView.title;
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
