//
//  UIView+WHC_Debuger.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//
//  Github <https://github.com/netyouli/WHC_Debuger>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
