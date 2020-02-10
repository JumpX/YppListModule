//
//  YppListModuleViewController.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "YppListModuleViewController.h"
#import <objc/runtime.h>

static int _YppModuleListView;

@implementation NSObject (YppListModuleProtocol)

- (void)setModuleListView:(UITableView * _Nullable)moduleListView {
    objc_setAssociatedObject(self, &_YppModuleListView, moduleListView, OBJC_ASSOCIATION_ASSIGN);
}

- (UITableView * _Nullable)moduleListView {
    return objc_getAssociatedObject(self, &_YppModuleListView);
}

@end

@implementation YppListModuleTableView

/* 支持多手势触发 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer {
    return _tableAllowBothRecognize;
}

@end

@interface YppListModuleHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) UIView        *displayView;

@end

@implementation YppListModuleHeader

- (void)setDisplayView:(UIView *)displayView {
    if (_displayView) {
        [_displayView removeFromSuperview];
    }
    if (displayView) {
        _displayView = displayView;
        [self.contentView addSubview:displayView];
        displayView.translatesAutoresizingMaskIntoConstraints = NO;
        [displayView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [displayView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
        [displayView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        [displayView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    }
}

@end

@interface YppListModuleCell : UITableViewCell

@property (nonatomic, strong) UIView        *displayView;

@end

@implementation YppListModuleCell

- (void)setDisplayView:(UIView *)displayView {
    if (_displayView) {
        [_displayView removeFromSuperview];
    }
    if (displayView) {
        _displayView = displayView;
        [self.contentView addSubview:displayView];
        displayView.translatesAutoresizingMaskIntoConstraints = NO;
        [displayView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [displayView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
        [displayView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        [displayView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    }
}

@end

@interface YppListModuleViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) YppListModuleTableView    *tableView;

// first viewDidAppear
@property (nonatomic, assign) BOOL          viewDidAppearIsCalled;

@end

@implementation YppListModuleViewController

#pragma mark - Life Cycle

- (instancetype)init {
    if (self = [super init]) {
        _tableStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.viewDidAppearIsCalled) {
        self.viewDidAppearIsCalled = YES;
    }
}

#pragma mark - Private Methods
#pragma mark - Private Methods - Module

- (id <YppListModuleProtocol>)moduleAtIndex:(NSInteger)index {
    NSArray *moduleList = [self moduleList];
    if (index >=0 && index < moduleList.count) {
        id <YppListModuleProtocol> originModule = moduleList[index];
        return [self module:originModule];
    }
    return nil;
}

- (id <YppListModuleProtocol>)module:(id <YppListModuleProtocol>)module {
    if ([module conformsToProtocol:@protocol(YppListModuleProtocol)]) {
        return module;
    }
    return nil;
}

- (UIViewController *)moduleViewController:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleDisplayByViewController)]) {
        return [module moduleDisplayByViewController];
    }
    return nil;
}

- (UIView *)moduleView:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleDisplayByView)]) {
        return [module moduleDisplayByView];
    }
    return nil;
}

- (CGFloat)moduleHeight:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeight)]) {
        return [module moduleHeight];
    }
    return CGFLOAT_MIN;
}

- (NSString *)moduleIdentifier:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleIdentifier)]) {
        return [module moduleIdentifier];
    }
    return @"";
}

- (void)moduleWillAppear:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleWillAppear)]) {
        [module moduleWillAppear];
    }
}

- (void)moduleDidDisappear:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleDidDisappear)]) {
        [module moduleDidDisappear];
    }
}

#pragma mark - Private Methods - Module Header

- (UIView *)moduleHeader:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeader)]) {
        return [module moduleHeader];
    }
    return [UIView new];
}

- (CGFloat)moduleHeaderHeight:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeaderHeight)]) {
        return [module moduleHeaderHeight];
    }
    return CGFLOAT_MIN;
}

- (NSString *)moduleHeaderIdentifier:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeaderIdentifier)]) {
        return [module moduleHeaderIdentifier];
    }
    return @"";
}

- (void)moduleHeaderWillAppear:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeaderWillAppear)]) {
        [module moduleHeaderWillAppear];
    }
}

- (void)moduleHeaderDidDisappear:(id <YppListModuleProtocol>)originModule {
    id <YppListModuleProtocol> module = [self module:originModule];
    if (module && [module respondsToSelector:@selector(moduleHeaderDidDisappear)]) {
        [module moduleHeaderDidDisappear];
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self moduleList].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YppListModuleProtocol> module = [self moduleAtIndex:indexPath.section];
    return [self moduleHeight:module];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YppListModuleProtocol> module = [self moduleAtIndex:indexPath.section];
    module.moduleListView = tableView;
    NSString *identifier = [self moduleIdentifier:module];
    UIViewController *moduleVC = [self moduleViewController:module];
    CGFloat height = [self moduleHeight:module];
    YppListModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YppListModuleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.contentView.clipsToBounds = YES;
    }
    
    if (!moduleVC) {
        UIView *moduleView = [self moduleView:module];
        moduleView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
        cell.displayView = moduleView;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YppListModuleProtocol> module = [self moduleAtIndex:indexPath.section];
    [self moduleWillAppear:module];
    
    UIViewController *moduleVC = [self moduleViewController:module];
    CGFloat height = [self moduleHeight:module];
    if (moduleVC && !moduleVC.parentViewController) {
        moduleVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
        [moduleVC willMoveToParentViewController:self];
        [self addChildViewController:moduleVC];
        [moduleVC beginAppearanceTransition:YES animated:YES];
        ((YppListModuleCell *)cell).displayView = moduleVC.view;
        [moduleVC didMoveToParentViewController:self];
        if (self.viewDidAppearIsCalled) {
            [moduleVC endAppearanceTransition];
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YppListModuleProtocol> module = [self moduleAtIndex:indexPath.section];
    UIViewController *moduleVC = [self moduleViewController:module];
    if (moduleVC && moduleVC.parentViewController) {
        [moduleVC willMoveToParentViewController:nil];
        [moduleVC beginAppearanceTransition:NO animated:YES];
        ((YppListModuleCell *)cell).displayView = nil;
        [moduleVC removeFromParentViewController];
        [moduleVC endAppearanceTransition];
    }
    
    [self moduleDidDisappear:module];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id <YppListModuleProtocol> module = [self moduleAtIndex:section];
    return [self moduleHeaderHeight:module];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id <YppListModuleProtocol> module = [self moduleAtIndex:section];
    NSString *identifier = [self moduleHeaderIdentifier:module];
    YppListModuleHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[YppListModuleHeader alloc] initWithReuseIdentifier:identifier];
    }
    UIView *view = [self moduleHeader:module];
    header.displayView = view;
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    id <YppListModuleProtocol> module = [self moduleAtIndex:section];
    [self moduleHeaderWillAppear:module];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    id <YppListModuleProtocol> module = [self moduleAtIndex:section];
    [self moduleHeaderDidDisappear:module];
}

#pragma mark - Getter

- (YppListModuleTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YppListModuleTableView alloc] initWithFrame:self.view.bounds style:_tableStyle];
        if (@available(iOS 11.0, *)) {
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
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

@end
