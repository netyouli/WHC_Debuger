//
//  UIViewController+WHC_Debuger.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//
#if DEBUG
#import "UIViewController+WHC_Debuger.h"
#import "WHC_Debuger.h"
#import <objc/runtime.h>

@implementation UIViewController (WHC_Debuger)

-(void)dealloc {
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method myViewWillAppear = class_getInstanceMethod(self, @selector(myViewWillAppear:));
        Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
        method_exchangeImplementations(viewWillAppear, myViewWillAppear);
    });
}

- (BOOL)isPrivateVC {
    NSString * selfClass = NSStringFromClass(self.class);
    return [selfClass isEqualToString:@"UIAlertController"] ||
    [selfClass isEqualToString:@"_UIAlertControllerTextFieldViewController"] ||
    [selfClass isEqualToString:@"UIApplicationRotationFollowingController"] ||
    [selfClass isEqualToString:@"UIInputWindowController"];
}

- (void)myViewWillAppear:(BOOL)animated {
    if (![self isPrivateVC]) {
        UILabel * noteLabel = WHC_Debuger.share.whc_NoteLabel;
        if (noteLabel.superview) {
            [noteLabel.superview bringSubviewToFront:noteLabel];
        }
        noteLabel.text = [NSString stringWithFormat:@"%@%@",WHC_Debuger.share.whc_CustomNote,[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject];
    }
    [self myViewWillAppear:animated];
}

@end

#endif
