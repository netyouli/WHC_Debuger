//
//  WHC_Debuger.swift
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

public class WHC_Debuger: NSObject {
    private var noteLabel: UILabel!
    
    /// 调式器单利对象
    static var share: WHC_Debuger = WHC_Debuger()
    
    /// 自定义要显示的信息
    public var whc_CustomNote: String!
    
    /// 显示信息标签
    public var whc_NoteLabel: UILabel {
        if noteLabel == nil {
            whc_CustomNote = " 当前控制器："
            noteLabel = UILabel()
            var noteLabelFrame = CGRect.zero
            noteLabelFrame.origin = CGPoint(x: 0, y: 16)
            noteLabelFrame.size = CGSize(width: UIScreen.main.bounds.width, height: 20)
            noteLabel.frame = noteLabelFrame
            noteLabel.textColor = UIColor(red: 53.0 / 255, green: 205.0 / 255, blue: 73.0 / 255, alpha: 1.0)
            noteLabel.adjustsFontSizeToFitWidth = true
            noteLabel.minimumScaleFactor = 0.5
            noteLabel.font = UIFont.systemFont(ofSize: 14)
            noteLabel.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        }
        if noteLabel.superview == nil {
            let window = UIApplication.shared.delegate?.window
            if window != nil && window! != nil {
                window!!.addSubview(noteLabel)
            }
        }
        return noteLabel
    }
}
    
#endif
