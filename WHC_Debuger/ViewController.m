//
//  ViewController.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WHC_AutoLayout.h"
#import "ViewControllerDemo1.h"

@interface ViewController ()
@property (nonatomic, strong)UIButton * button;
@property (nonatomic, strong)UIButton * buttonUI;
@property (nonatomic, strong)UILabel * label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"iOS Debuger";
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
    /// 添加约束
    _button.whc_Center(CGPointMake(0, -60))
    .whc_Size(CGSizeMake(100, 100));
    
    _buttonUI.whc_CenterX(0)
    .whc_TopSpaceToView(20,_button)
    .whc_Size(CGSizeMake(100, 100));
    
    _label.whc_TopSpaceToView(20,_buttonUI)
    .whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_HeightAuto();
}

- (void)layoutUI {
    _button = UIButton.new;
    [_button setTitle:@"PUSH" forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor greenColor];
    [_button addTarget:self action:@selector(clickPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _buttonUI = UIButton.new;
    [_buttonUI setTitle:@"ThreadUI" forState:UIControlStateNormal];
    _buttonUI.backgroundColor = [UIColor orangeColor];
    [_buttonUI addTarget:self action:@selector(clickButtonUI:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonUI];
    
    _label = UILabel.new;
    _label.backgroundColor = [UIColor grayColor];
    _label.textColor = [UIColor redColor];
    _label.text = @"改变文字演示";
    [self.view addSubview:_label];
}

- (void)clickPush:(UIButton *)sender {
    ViewControllerDemo1 * vc = ViewControllerDemo1.new;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickButtonUI:(UIButton *)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if ([self.label.text isEqualToString:@"改变文字演示"]) {
            self.label.whc_HeightAuto();
            self.label.text = @"改变frame演示";
        }else {
            self.label.whc_Height(40);
            self.label.text = @"改变文字演示";
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
