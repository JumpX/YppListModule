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
/// 模块-高度
- (CGFloat)moduleHeight;
/// 模块-标识符
- (NSString *)moduleIdentifier;

@optional
/**
 模块-视图，只会是ViewController或View其中一种，只需实现其中一个视图方法
 */
/// 视图--View
- (UIView *)moduleDisplayByView;
/// 视图--ViewController（VC具有生命周期，最终展示的是vc.view）
- (UIViewController *)moduleDisplayByViewController;

/// 模块即将显示
- (void)moduleWillAppear;
/// 模块将要消失
- (void)moduleDidDisappear;


/**
 这两个方法，若要使用，则需要主动实现并主动调用
 */
/// 模块绑定数据（适用于数据驱动列表）
- (void)moduleBindData:(id)data;
/// 模块是否跟随模块列表下拉刷新而刷新
- (void)moduleIfRefreshWhenModuleListRefresh;


/**
 暴露出模块列表，主要两个用途：
 1.更新模块高度
 [self.moduleListView beginUpdates];
 [self.moduleListView endUpdates];
 2.刷新模块列表
 [self.moduleListView reloadData]
*/
@property (nonatomic, weak) UITableView *moduleListView; /* 模块所在的列表 */


/*********************************************************/
/** 模块Header (建议只在需要使用吸顶悬浮的SectionHeader时使用) **/
/*********************************************************/

/// 模块Header-视图
- (UIView *)moduleHeader;
/// 模块Header-高度
- (CGFloat)moduleHeaderHeight;
/// 模块Header-标识符
- (NSString *)moduleHeaderIdentifier;
/// 模块Header-绑定数据
- (void)moduleHeaderBindData:(id)data;
/// 模块Header-即将显示
- (void)moduleHeaderWillAppear;
/// 模块Header-将要消失
- (void)moduleHeaderDidDisappear;

@end

NS_ASSUME_NONNULL_END
