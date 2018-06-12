//
//  RegisterViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/23.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    //邮箱文本框
    @IBOutlet weak var email: UITextField!
    //密码文本框
    @IBOutlet weak var passWord: UITextField!
    //确认密码文本框
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //绑定文本框委托
        self.email.delegate = self
        self.passWord.delegate = self
        self.confirmPassword.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TextFieldDelegate委托方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //按return收起键盘
        if textField == self.email {
           self.email.resignFirstResponder()
            return true
        }else if textField == self.passWord{
            self.passWord.resignFirstResponder()
            return true
        }else {
            self.confirmPassword.resignFirstResponder()
            return true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.email.resignFirstResponder()
        self.passWord.resignFirstResponder()
        self.confirmPassword.resignFirstResponder()
    }
    
    //注册用户按钮事件
    @IBAction func doRegister(_ sender: Any) {
        let strURL = "http://i.joyelectronics.com.cn/bodyscale1/syn_initial.php"
                    let params = ["email" : "1326700455@qq.com"]
                    Alamofire.request(strURL, method: .get, parameters: params)
                        .responseArray { (response: DataResponse<[UserModel]>) in
                        if let data = response.result.value{
                            print(data[0].email)
                        }
                }
        }
}
