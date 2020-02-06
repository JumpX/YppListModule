//
//  YppListModuleProtocol.h
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YppListModuleProtocol <NSObject>
@required
/// 模块高度
- (CGFloat)moduleHeight;
/// 模块标识符
- (NSString *)moduleIdentifier;

@optional
/// 模块视图（只会是ViewController或View其中一种，只需实现其中一个视图方法）
- (UIView *)moduleDisplayByView; /* 模块视图--View */
/* 模块视图--ViewController（VC具有生命周期，最终展示的是vc.view） */
- (UIViewController *)moduleDisplayByViewController;

/// 模块绑定数据
- (void)moduleBindData:(id)data; /* 一般不用。若要使用，则需要实现该方法并要主动调用，适用于数据驱动列表 */

- (void)moduleWillAppear;   /* 模块即将显示 */
- (void)moduleDidDisappear; /* 模块将要消失 */

/*
 暴露出模块列表，主要两个用途：
 1.更新模块高度
 [self.moduleListView beginUpdates];
 [self.moduleListView endUpdates];
 2.刷新模块列表
 [self.moduleListView reloadData]
*/
@property (nonatomic, weak) UITableView *moduleListView; /* 模块所在的列表 */

/* 模块Header，建议只在需要使用吸顶悬浮的SectionHeader时使用 */

/// 模块Header视图
- (UIView *)moduleHeader;
/// 模块Header高度
- (CGFloat)moduleHeaderHeight;
/// 模块Header标识符
- (NSString *)moduleHeaderIdentifier;
/// 模块Header绑定数据
- (void)moduleHeaderBindData:(id)data;
/// 模块Header即将显示
- (void)moduleHeaderWillAppear;
/// 模块Header将要消失
- (void)moduleHeaderDidDisappear;

@end

NS_ASSUME_NONNULL_END
