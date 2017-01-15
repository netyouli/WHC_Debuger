//
//  ViewControllerDemo1.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#import "ViewControllerDemo1.h"
#import "UIView+WHC_AutoLayout.h"
#import "ViewControllerDemo2.h"

@interface ViewControllerDemo1 ()
@property (nonatomic, strong)UIButton * button;
@property (nonatomic, strong)UIButton * popButton;
@end

@implementation ViewControllerDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"iOS 辅助调式器";
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
    /// 添加约束
    _button.whc_Center(CGPointMake(0, -100))
    .whc_Size(CGSizeMake(100, 100));
    
    _popButton.whc_CenterX(0)
    .whc_TopSpaceToView(20,_button)
    .whc_Size(CGSizeMake(100, 100));
}

- (void)layoutUI {
    _button = UIButton.new;
    [_button setTitle:@"Present" forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor magentaColor];
    [_button addTarget:self action:@selector(clickPresent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _popButton = UIButton.new;
    [_popButton setTitle:@"Pop" forState:UIControlStateNormal];
    _popButton.backgroundColor = [UIColor orangeColor];
    [_popButton addTarget:self action:@selector(clickPop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_popButton];
}

- (void)clickPresent:(UIButton *)sender {
    ViewControllerDemo2 * vc = ViewControllerDemo2.new;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)clickPop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
