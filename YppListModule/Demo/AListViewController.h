//
//  AListViewController.h
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YppListModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AListViewController : UIViewController<YppListModuleProtocol>

- (instancetype)initWithType:(NSString *)type bgColor:(UIColor *)bgColor;

@end

NS_ASSUME_NONNULL_END
