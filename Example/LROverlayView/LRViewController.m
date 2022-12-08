//
//  LRViewController.m
//  LROverlayView
//
//  Created by huawt on 12/08/2022.
//  Copyright (c) 2022 huawt. All rights reserved.
//

#import "LRViewController.h"
#import <LROverlayView/LROverlayView.h>

@interface LRViewController ()
@property (nonatomic, assign) BOOL enable;
@end

@implementation LRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [LROverlayView showStyle:LROverlayStyle_OverWindow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"123" message:@"456" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    self.enable = !self.enable;
    [LROverlayTool enable:self.enable];
}


@end
