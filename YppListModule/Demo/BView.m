//
//  BView.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "BView.h"

@implementation BView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleView {
    return self;
}

- (CGFloat)moduleHeight {
    return 100;
}

- (NSString *)moduleIdentifier {
    return @"B";
}

@end
