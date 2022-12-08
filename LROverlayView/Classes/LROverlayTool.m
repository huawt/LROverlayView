//
//  LROverlayTool.m
//  LROverlayView
//
//  Created by WinTer on 2022/12/8.
//

#import "LROverlayTool.h"
#import "LROverView.h"
#import <objc/runtime.h>

@interface LROverlayTool ()
@property (nonatomic, assign, readwrite) BOOL enableOverlay;
@end

@implementation LROverlayTool
+ (instancetype)shared
{
    static dispatch_once_t __singletonToken;
    static id __singleton__;
    dispatch_once( &__singletonToken, ^{ __singleton__ = [[self alloc] initPrivate]; } );
    return __singleton__;
}
- (instancetype)init
{
    NSAssert(NO, @"");
    return nil;
}
- (instancetype)initPrivate
{
    if (self = [super init]) {
        
    }
    return self;
}

+ (void)enable:(BOOL)enable {
    [LROverlayTool shared].enableOverlay = enable;
    if (enable) {
        [LROverlayTool showStyle:LROverlayStyle_OverWindow];
    } else {
        [LROverlayTool clear];
    }
}

+ (void)showStyle:(LROverlayStyle)style {
    [LROverView showStyle:style];
}

+ (void)clear {
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *window in windows) {
        for (UIView *sub in window.subviews) {
            if ([sub isKindOfClass:[LROverView class]]) {
                [sub removeFromSuperview];
            }
        }
    }
    for (UIView *sub in [LROverlayTool getCurrentViewController].view.subviews) {
        if ([sub isKindOfClass:[LROverView class]]) {
            [sub removeFromSuperview];
        }
    }
}

+ (UIViewController * _Nullable)getCurrentViewController {
    UIViewController *root = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (root == nil) { return nil; }
    while (YES) {
        if ([root isKindOfClass:[UITabBarController class]]) {
            root = ((UITabBarController *)root).selectedViewController;
        }
        if ([root isKindOfClass:[UINavigationController class]]) {
            root = ((UINavigationController *)root).visibleViewController;
        }
        if (root.presentedViewController) {
            root = root.presentedViewController;
        } else {
            break;
        }
    }
    return  root;
}

@end


@interface UIWindow (OverLay)
@end
@implementation UIWindow (OverLay)

+ (void)load {
    // Method Swizzling
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            //根据selector查找Method
            SEL selA = @selector(becomeKeyWindow);
            SEL selB = @selector(new_becomeKeyWindow);
            Method methodA = class_getInstanceMethod(self,selA);
            Method methodB = class_getInstanceMethod(self, selB);
            //添加自定义方法
            BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
            
            if (isAdd) {//添加成功->替换
                class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
            }else{//添加不成功->交换
                //添加失败了 说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
                method_exchangeImplementations(methodA, methodB);
            }
        });
}

- (void)new_makeKeyAndVisible {
    [self new_makeKeyAndVisible];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LROverView showIn:self];
    });
}

- (void)new_becomeKeyWindow {
    [self new_becomeKeyWindow];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LROverView showIn:self];
    });
}

@end
