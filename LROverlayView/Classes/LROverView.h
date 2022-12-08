//
//  LROverView.h
//  LROverlayView
//
//  Created by WinTer on 2022/12/8.
//

#import <UIKit/UIKit.h>
#import "LROverHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface LROverView : UIView
+ (void)showStyle: (LROverlayStyle)style;
+ (void)showIn:(UIView *)aSuperView;
@end

NS_ASSUME_NONNULL_END
