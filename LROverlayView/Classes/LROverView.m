//
//  LROverView.m
//  LROverlayView
//
//  Created by WinTer on 2022/12/8.
//

#import "LROverView.h"
#import "LROverlayTool.h"

@implementation LROverView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.compositingFilter = @"saturationBlendMode";
        self.userInteractionEnabled = NO;
        self.layer.zPosition = 10000;
    }
    return self;
}

+ (void)showStyle:(LROverlayStyle)style {
    LROverView *view = [[LROverView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view showStyle:style];
}

- (void)showStyle:(LROverlayStyle)style {
    switch (style) {
        case LROverlayStyle_OverView: {
            UIViewController *current = [LROverlayTool getCurrentViewController];
            if (current) {
                [self showIn:current.view];
            } else {
                [self showStyle:LROverlayStyle_OverWindow];
            }
        }break;
        case LROverlayStyle_OverWindow: {
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            if (window) {
                [self showIn:window];
            } else {
            }
        }break;
    }
}

+ (void)showIn:(UIView *)aSuperView {
    if ([LROverlayTool shared].enableOverlay == NO) { return; }
    LROverView *view = [[LROverView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view showIn:aSuperView];
}
- (void)showIn:(UIView *)aSuperView {
    if (aSuperView == nil) { return; }
    for (UIView *sub in aSuperView.subviews) {
        if ([sub isKindOfClass:[LROverView class]]) {
            [sub removeFromSuperview];
        }
    }
    [aSuperView addSubview:self];
}

- (void)dealloc {
    [self removeFromSuperview];
}

@end
