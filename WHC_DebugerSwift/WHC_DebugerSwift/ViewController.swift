//
//  ViewController.swift
//  WHC_DebugerSwift
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let button = UIButton()
    private let buttonUI = UIButton()
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.title = "iOS Debuger";
        layoutUI()
        
        /// 添加约束
        button.whc_Center(0, y: -60)
        .whc_Size(100, height: 100)

        buttonUI.whc_CenterX(0)
        .whc_Top(20, toView: button)
        .whc_SizeEqual(button)

        label.whc_Top(20, toView: buttonUI)
        .whc_Left(10)
        .whc_Right(10)
        .whc_HeightAuto()

    }
    
    private func layoutUI() {
        button.setTitle("PUSH", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(clickPush(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        buttonUI.setTitle("ThreadUI", for: .normal)
        buttonUI.backgroundColor = UIColor.orange
        buttonUI.addTarget(self, action: #selector(clickButtonUI(_:)), for: .touchUpInside)
        self.view.addSubview(buttonUI)
        
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.text = "改变文字演示"
        self.view.addSubview(label)
    }

    @objc private func clickPush(_ sender: UIButton) {
        let vc = ViewControllerDemo1()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func clickButtonUI(_ sender: UIButton) {
        DispatchQueue.global().async {
            if self.label.text == "改变文字演示" {
                self.label.whc_HeightAuto()
                self.label.text = "改变frame演示"
            }else {
                self.label.whc_Height(40)
                self.label.text = "改变文字演示"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

