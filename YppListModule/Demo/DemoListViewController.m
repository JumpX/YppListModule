//
//  DemoListViewController.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "DemoListViewController.h"
#import "AListViewController.h"
#import "BView.h"
#import "CView.h"
#import "DObject.h"

@interface DemoListViewController ()

@property (nonatomic, strong) BView                 *bModule;
@property (nonatomic, strong) CView                 *cModule;
@property (nonatomic, strong) DObject               *dModule;
@property (nonatomic, strong) AListViewController   *eModule;
@property (nonatomic, strong) AListViewController   *fModule;
@property (nonatomic, strong) AListViewController   *gModule;

@end

@implementation DemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DEMO-MODULE";
    CGRect rect = self.view.bounds;
    rect.origin.y = 88;
    rect.size.height -= 88;
    self.tableView.frame = rect;
    
    [self initModules];
    [self.tableView reloadData];
}

- (void)initModules {
    self.bModule = [BView new];
    self.cModule = [CView new];
    self.dModule = [DObject new];
    self.eModule = [[AListViewController alloc] initWithType:@"eList" bgColor:[UIColor brownColor]];
    self.fModule = [[AListViewController alloc] initWithType:@"fList" bgColor:[UIColor cyanColor]];
    self.gModule = [[AListViewController alloc] initWithType:@"gList" bgColor:[UIColor systemYellowColor]];
}

- (NSArray <id <YppListModuleProtocol>> *)moduleList {
    return @[self.bModule,
             self.cModule,
             self.dModule,
             self.eModule,
             self.fModule,
             self.gModule];
}

@end
