//
//  ForgetPasswordViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/17.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
class ForgetPasswordViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var EmailTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EmailTextView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //点击return键收起键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.EmailTextView.resignFirstResponder()
        return false
    }
    
    //点击键盘以外区域收起键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.EmailTextView.resignFirstResponder()
    }
    
    
}
