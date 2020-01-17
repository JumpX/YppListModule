//
//  CView.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "CView.h"

@implementation CView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleView {
    return self;
}

- (CGFloat)moduleHeight {
    return 130;
}

- (NSString *)moduleIdentifier {
    return @"C";
}

@end
