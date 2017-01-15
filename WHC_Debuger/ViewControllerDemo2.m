//
//  ViewControllerDemo2.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#import "ViewControllerDemo2.h"
#import "UIView+WHC_AutoLayout.h"

@interface ViewControllerDemo2 ()

@end

@implementation ViewControllerDemo2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"iOS 辅助调式器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * dismissButton = UIButton.new;
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    dismissButton.backgroundColor = [UIColor blueColor];
    [dismissButton addTarget:self action:@selector(clickDismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    
    /// 添加约束
    dismissButton.whc_Center(CGPointMake(0, 0))
    .whc_Size(CGSizeMake(100, 100));
}

- (void)clickDismiss:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
