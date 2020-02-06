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

@property (nonatomic, strong) CView     *view;
@property (nonatomic, assign) CGFloat   height;

@end

@implementation DObject

- (instancetype)init {
    if (self = [super init]) {
        _view = [CView new];
        _view.backgroundColor = [UIColor greenColor];
        self.height = 200;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"D-改变高度" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(100, 20, 100, 50);
        [_view addSubview:button];
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.height = sender.selected ? 240 : 200;
    [self.moduleListView beginUpdates];
    [self.moduleListView endUpdates];
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleDisplayByView {
    return self.view;
}

- (CGFloat)moduleHeight {
    return self.height;
}

- (NSString *)moduleIdentifier {
    return @"D";
}

@end
