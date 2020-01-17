//
//  ViewController.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "ViewController.h"
#import "DemoListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(200, 200, 100, 160);
    [btn setTitle:@"Demo" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(demoClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)demoClick {
    [self.navigationController pushViewController:[DemoListViewController new] animated:YES];
}


@end
