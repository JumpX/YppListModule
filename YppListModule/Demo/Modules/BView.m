//
//  BView.m
//  YppListModule
//
//  Created by 徐勉俊 on 2020/1/16.
//  Copyright © 2020 徐勉俊. All rights reserved.
//

#import "BView.h"

@interface BView ()

@property (nonatomic, assign) CGFloat   height;

@end

@implementation BView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.height = 100;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"B-改变高度" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(100, 20, 100, 50);
        [self addSubview:button];
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.height = sender.selected ? 200 : 100;
    
//    [self.moduleListView beginUpdates];
//    [self.moduleListView endUpdates];
    
    [self.moduleListView reloadData];
}

#pragma mark - YppListModuleProtocol

- (UIView *)moduleDisplayByView {
    return self;
}

- (CGFloat)moduleHeight {
    return self.height;
}

- (NSString *)moduleIdentifier {
    return @"B";
}

//- (UIView *)moduleHeader {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
//    label.text = @"B-Header";
//    return label;
//}
//
//- (CGFloat)moduleHeaderHeight {
//    return 50.0;
//}
//
//- (NSString *)moduleHeaderIdentifier {
//    return @"B-header";
//}
//
//- (void)moduleHeaderWillAppear {
//    NSLog(@"B-moduleHeaderWillAppear");
//}
//
//- (void)moduleHeaderDidDisappear {
//    NSLog(@"B-moduleHeaderDidDisappear");
//}

@end
