//
//  ViewControllerDemo1.swift
//  WHC_DebugerSwift
//
//  Created by WHC on 17/1/15.
//  Copyright © 2017年 WHC. All rights reserved.
//

import UIKit

class ViewControllerDemo1: UIViewController {

    private let button = UIButton()
    private let popButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "iOS 辅助调式器"
        self.view.backgroundColor = UIColor.white
        self.layoutUI()
        
        /// 添加约束
        button.whc_Center(0, y: -100)
        .whc_Size(100, height: 100)
        
        popButton.whc_CenterX(0)
        .whc_Top(20, toView: button)
        .whc_SizeEqual(button)
    }

    private func layoutUI() {
        button.setTitle("Present", for: .normal)
        button.backgroundColor = UIColor.magenta
        button.addTarget(self, action: #selector(clickPresent(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        popButton.setTitle("Pop", for: .normal)
        popButton.backgroundColor = UIColor.magenta
        popButton.addTarget(self, action: #selector(clickPop(_:)), for: .touchUpInside)
        self.view.addSubview(popButton)
    }
    
    @objc private func clickPresent(_ sender: UIButton) {
        let vc = ViewControllerDemo2()
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func clickPop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
