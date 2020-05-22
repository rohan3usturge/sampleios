//
//  ViewController.m
//  sampleios
//
//  Created by Rohan on 22/05/20.
//  Copyright © 2020 Rohan. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) NSDate *start;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 10000)];
    [webView setDelegate:self];
    NSString *urlAddress = @"https://www.walmart.ca/cart";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    self.start = [NSDate date];
    [webView loadRequest:requestObj];
    [self.view addSubview:webView];
}



- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if(webView.isLoading) {
        return;
    }
    NSTimeInterval timeInterval = fabs([self.start timeIntervalSinceNow]) * 1000;
    NSLog(@"Web View Finished Loading %.20f", timeInterval);

    
}

@end
