//
//  LROverlayView.h
//  Pods
//
//  Created by WinTer on 2022/12/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<LROverlayView/LROverlayView.h>)

FOUNDATION_EXPORT double LROverlayViewVersionNumber;
FOUNDATION_EXPORT const unsigned char LROverlayViewVersionString[];

#import <LROverlayView/LROverHeader.h>
#import <LROverlayView/LROverlayTool.h>
#import <LROverlayView/LROverView.h>

#else
#import "LROverHeader.h"
#import "LROverlayTool.h"
#import "LROverView.h"

#endif
