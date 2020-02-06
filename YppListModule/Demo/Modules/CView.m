//
//  CView.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "CView.h"

@interface CView ()

@property (nonatomic, assign) CGFloat   height;

@end

@implementation CView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        self.height = 130;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"C-改变高度" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(100, 20, 100, 50);
        [self addSubview:button];
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.height = sender.selected ? 50 : 130;
    
    [self.moduleListView beginUpdates];
    [self.moduleListView endUpdates];
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleDisplayByView {
    return self;
}

- (CGFloat)moduleHeight {
    return self.height;
}

- (NSString *)moduleIdentifier {
    return @"C";
}

- (UIView *)moduleHeader {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    label.text = @"C-Header";
    return label;
}

- (CGFloat)moduleHeaderHeight {
    return 50.0;
}

- (NSString *)moduleHeaderIdentifier {
    return @"C-header";
}

- (void)moduleHeaderWillAppear {
    NSLog(@"C-moduleHeaderWillAppear");
}

- (void)moduleHeaderDidDisappear {
    NSLog(@"C-moduleHeaderDidDisappear");
}

@end
