//
//  ViewControllerDemo2.swift
//  WHC_DebugerSwift
//
//  Created by WHC on 17/1/15.
//  Copyright © 2017年 WHC. All rights reserved.
//

import UIKit

class ViewControllerDemo2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "iOS 辅助调式器"
        self.view.backgroundColor = UIColor.white
        
        let dismissButton = UIButton()
        self.view.addSubview(dismissButton)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.backgroundColor = UIColor.magenta
        dismissButton.addTarget(self, action: #selector(clickDismiss(_:)), for: .touchUpInside)

        dismissButton.whc_Center(0, y: 0)
        .whc_Size(100, height: 100)

    }
    
    @objc private func clickDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
