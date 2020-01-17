//
//  DObject.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "DObject.h"
#import "CView.h"

@interface DObject ()

@property (nonatomic, strong) CView *view;

@end

@implementation DObject

- (instancetype)init {
    if (self = [super init]) {
        _view = [CView new];
        _view.backgroundColor = [UIColor greenColor];
    }
    return self;
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleView {
    return self.view;
}

- (CGFloat)moduleHeight {
    return 200;
}

- (NSString *)moduleIdentifier {
    return @"D";
}

@end
