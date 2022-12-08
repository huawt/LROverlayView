//
//  LROverlayTool.h
//  LROverlayView
//
//  Created by WinTer on 2022/12/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LROverHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface LROverlayTool : NSObject
@property (nonatomic, assign, readonly) BOOL enableOverlay;
+ (instancetype)shared;
+ (void)enable:(BOOL)enable;
+ (void)showStyle: (LROverlayStyle)style;
+ (UIViewController * _Nullable)getCurrentViewController;
@end

NS_ASSUME_NONNULL_END
