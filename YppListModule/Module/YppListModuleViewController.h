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

/// 列表样式：UITableViewStylePlain可以吸顶悬浮SectionHeader，默认UITableViewStyleGrouped
@property (nonatomic, assign) UITableViewStyle                      tableStyle;
/// 模块列表
@property (nonatomic, strong) UITableView                           *tableView;
/// 组装模块
@property (nonatomic, strong) NSArray<id <YppListModuleProtocol>>   *moduleList;

@end

NS_ASSUME_NONNULL_END
