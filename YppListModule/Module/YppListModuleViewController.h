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

@class YppListModuleTableView;
@interface YppListModuleViewController : UIViewController

/// 列表样式：UITableViewStylePlain可以吸顶悬浮SectionHeader，默认UITableViewStyleGrouped
@property (nonatomic, assign) UITableViewStyle                      tableStyle;
/// 模块列表
@property (nonatomic, readonly) YppListModuleTableView              *tableView;
/// 组装模块
@property (nonatomic, strong) NSArray<id <YppListModuleProtocol>>   *moduleList;


- (id <YppListModuleProtocol>)moduleAtIndex:(NSInteger)index;

@end

@interface YppListModuleTableView : UITableView

/// 手势穿透：适用于模块内有吸顶悬浮View，默认NO
@property (nonatomic, assign) BOOL                  tableAllowBothRecognize;

@end

NS_ASSUME_NONNULL_END
