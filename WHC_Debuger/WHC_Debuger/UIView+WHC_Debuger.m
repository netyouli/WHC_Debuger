//
//  UIView+WHC_Debuger.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#if DEBUG
#import "UIView+WHC_Debuger.h"
#import <objc/runtime.h>

@implementation UIView (WHC_Debuger)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method mySetNeedsDisplay = class_getInstanceMethod(self, @selector(mySetNeedsDisplay));
        Method setNeedsDisplay = class_getInstanceMethod(self, @selector(setNeedsDisplay));
        method_exchangeImplementations(setNeedsDisplay, mySetNeedsDisplay);
    });
}

- (void)mySetNeedsDisplay {
    if (NSThread.currentThread != NSThread.mainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString * note = [NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject;
            NSString * msg = [NSString stringWithFormat:@"%@不在主线程操作UI,危险!!",note];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"WHC_Debuger" message:msg delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alert show];
            NSLog(@">>>>>>>>>%@<<<<<<<<<",msg);
        });
    }
    [self mySetNeedsDisplay];
}

@end

#endif
