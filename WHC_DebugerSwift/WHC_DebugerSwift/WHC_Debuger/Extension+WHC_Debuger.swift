//
//  UIView-WHC_Debuger.swift
//  WHC_DebugerSwift
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
import UIKit

extension UIView {
    @objc fileprivate func mySetNeedsDisplay() {
        if Thread.current != Thread.main {
            DispatchQueue.main.async {
                let note = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
                let msg = note + "不在主线程操作UI,危险!!"
                UIAlertView(title: "WHC_Debuger", message: msg, delegate: nil, cancelButtonTitle: "OK").show()
                print(">>>>>>>>>\(msg)<<<<<<<<<")
            }
        }
        self.mySetNeedsDisplay()
    }
}

extension UIViewController {

    /// 私有控制器类集合
    private func isPrivateVC() -> Bool {
        let selfClass = NSStringFromClass(self.classForCoder)
        return selfClass == "UIAlertController" ||
        selfClass == "_UIAlertControllerTextFieldViewController" ||
        selfClass == "UIApplicationRotationFollowingController" ||
        selfClass == "UIInputWindowController"
    }
    
    @objc fileprivate func myViewWillAppear(_ animation: Bool) {
        if !isPrivateVC() {
            let noteLabel = WHC_Debuger.share.whc_NoteLabel
            if noteLabel.superview != nil {
                noteLabel.superview!.bringSubview(toFront: noteLabel)
            }
            if WHC_Debuger.share.whc_CustomNote == nil {
                WHC_Debuger.share.whc_CustomNote = " "
            }
            noteLabel.text = WHC_Debuger.share.whc_CustomNote + NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
        }
        myViewWillAppear(animation)
    }
    
    override open class func initialize() {
        struct WHC_DEBUGER {
            static var token: Int = 0
        }
        if WHC_DEBUGER.token == 0 {
            WHC_DEBUGER.token = 1
            let setNeedsDisplay = class_getInstanceMethod(UIView.self, #selector(CALayer.setNeedsDisplay))
            let mySetNeedsDisplay = class_getInstanceMethod(UIView.self, #selector(UIView.mySetNeedsDisplay))
            method_exchangeImplementations(setNeedsDisplay, mySetNeedsDisplay)
            
            let viewWillAppear = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.viewWillAppear(_:)))
            let myViewWillAppear = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.myViewWillAppear(_:)))
            method_exchangeImplementations(viewWillAppear, myViewWillAppear)
        }
    }
}

#endif
