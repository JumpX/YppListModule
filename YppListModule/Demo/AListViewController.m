//
//  AListViewController.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "AListViewController.h"

@interface AListViewController ()

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *dataList;
@property (nonatomic, copy)   NSString      *type;
@property (nonatomic, strong) UIColor       *bgColor;
@property (nonatomic, assign) CGFloat       rowHeight;

@end

@implementation AListViewController

- (instancetype)initWithType:(NSString *)type bgColor:(UIColor *)bgColor {
    if (self = [self init]) {
        _type = type;
        _bgColor = bgColor;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        NSMutableArray *list = [NSMutableArray new];
        for (NSInteger i = 0; i < 13; i ++) {
            NSString *name = [NSString stringWithFormat:@"列表第%zd行", i];
            [list addObject:name];
        }
        _dataList = [list copy];
        _rowHeight = 60;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    [self.tableView reloadData];
    self.tableView.scrollEnabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - YppListModuleProtocol

- (void)moduleWillAppear {
    NSLog(@"（%@） --> --> %s", NSStringFromClass([self class]), __func__);
}

- (void)moduleDidDisappear {
    NSLog(@"（%@） --> --> %s", NSStringFromClass([self class]), __func__);
}

- (UIViewController *)moduleViewController {
    return self;
}

- (UIView *)moduleView {
    return self.tableView;
}

- (CGFloat)moduleHeight {
    return self.dataList.count * _rowHeight;
}

- (NSString *)moduleIdentifier {
    return _type ?: @"ListDefaultType";
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"listA_CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        if (@available(iOS 11.0, *)){
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            [self.view addSubview:[UIView new]]; // 防止UITableViewStyleGrouped奇怪偏移
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.delegate = (id<UITableViewDelegate>)self;
        _tableView.dataSource = (id<UITableViewDataSource>)self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionHeaderHeight = CGFLOAT_MIN;
        _tableView.sectionFooterHeight = CGFLOAT_MIN;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

@end
