//
//  YppListModuleViewController.h
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YppListModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YppListModuleViewController : UIViewController

@property (nonatomic, strong) UITableView                   *tableView;

- (NSArray <id <YppListModuleProtocol>> *)moduleList;

- (id <YppListModuleProtocol>)moduleAtIndex:(NSInteger)index;
- (id <YppListModuleProtocol>)module:(id <YppListModuleProtocol>)module;
- (UIViewController *)moduleViewController:(id <YppListModuleProtocol>)originModule;
- (UIView *)moduleView:(id <YppListModuleProtocol>)originModule;
- (CGFloat)moduleHeight:(id <YppListModuleProtocol>)originModule;
- (NSString *)moduleIdentifier:(id <YppListModuleProtocol>)originModule;
- (void)moduleWillAppear:(id <YppListModuleProtocol>)originModule;
- (void)moduleDidDisappear:(id <YppListModuleProtocol>)originModule;

@end

NS_ASSUME_NONNULL_END
