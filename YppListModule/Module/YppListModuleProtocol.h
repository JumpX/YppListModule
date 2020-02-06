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
- (UIView *)moduleView;
- (CGFloat)moduleHeight;
- (NSString *)moduleIdentifier;

@optional
- (UIViewController *)moduleViewController;

- (UIView *)moduleHeader;
- (CGFloat)moduleHeaderHeight;

- (void)moduleWillAppear;
- (void)moduleDidDisappear;

@end

NS_ASSUME_NONNULL_END
