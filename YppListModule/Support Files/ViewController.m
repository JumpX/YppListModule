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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2.0-120, 200, 240, 120);
    [btn setTitle:@"列表模块化框架-Demo" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(demoClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)demoClick {
    [self.navigationController pushViewController:[DemoListViewController new] animated:YES];
}


@end
