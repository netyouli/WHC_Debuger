//
//  WHC_Debuger.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#if DEBUG
#import "WHC_Debuger.h"

@interface WHC_Debuger ()
@property (nonatomic, strong) UILabel * noteLabel;
@end

@implementation WHC_Debuger

+ (instancetype)share {
    static WHC_Debuger * debuger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debuger = WHC_Debuger.new;
    });
    return debuger;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.whc_CustomNote = @" 当前控制器：";
    }
    return self;
}

- (UILabel *)whc_NoteLabel {
    if (!_noteLabel) {
        CGRect noteLabelFrame;
        noteLabelFrame.origin = CGPointMake(0, 16);
        noteLabelFrame.size = CGSizeMake(CGRectGetWidth(UIScreen.mainScreen.bounds), 20);
        _noteLabel = UILabel.new;
        _noteLabel.frame = noteLabelFrame;
        _noteLabel.textColor = [UIColor colorWithRed:53.0 / 255 green:205.0 / 255 blue:73.0 / 255 alpha:1.0];
        _noteLabel.adjustsFontSizeToFitWidth = YES;
        _noteLabel.minimumScaleFactor = 0.5;
        _noteLabel.font = [UIFont systemFontOfSize:14];
        _noteLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    if (!_noteLabel.superview) {
        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
        if (window) {
            [window addSubview:_noteLabel];
        }
    }
    return _noteLabel;
}

@end

#endif
