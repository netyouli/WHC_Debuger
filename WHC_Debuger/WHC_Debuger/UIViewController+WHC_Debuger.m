//
//  UIViewController+WHC_Debuger.m
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
#import "UIViewController+WHC_Debuger.h"
#import "WHC_Debuger.h"
#import <objc/runtime.h>

@implementation UIViewController (WHC_Debuger)

- (void)myDealloc {
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self myDealloc];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method myViewWillAppear = class_getInstanceMethod(self, @selector(myViewWillAppear:));
        Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
        method_exchangeImplementations(viewWillAppear, myViewWillAppear);
        
        Method myDealloc = class_getInstanceMethod(self, @selector(myDealloc));
        Method dealloc = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        method_exchangeImplementations(dealloc, myDealloc);
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
        if (WHC_Debuger.share.whc_CustomNote == nil) {
            WHC_Debuger.share.whc_CustomNote = @" ";
        }
        noteLabel.text = [NSString stringWithFormat:@"%@%@",WHC_Debuger.share.whc_CustomNote,[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject];
    }
    [self myViewWillAppear:animated];
}

@end

#endif
