//
//  LoginViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/16.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import AlamofireObjectMapper
class LoginViewController: UIViewController, UITextFieldDelegate{
    
    //实现textField的绑定
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passWordTxtField: UITextField!
    
    //提示框
    var alertController: UIAlertController! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passWordTxtField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //实现UITextFieldDelegate协议
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //判断是哪一个textField
        if textField == self.emailTxtField {
            textField.resignFirstResponder() //收起键盘
            return true
        }else if textField == self.passWordTxtField {
            textField.resignFirstResponder()  //收起键盘
            return true
        }
        return true
    }
    
    //实现触碰到键盘以为的地方都收起键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTxtField.resignFirstResponder()
        self.passWordTxtField.resignFirstResponder()
    }
    
    //登录按钮事件
    @IBAction func doLogin(_ sender: Any) {
            //用于保存用户邮箱和密码的变量
            let emailText = self.emailTxtField.text!
            let passWordText = self.passWordTxtField.text!
            //请求登录API
            let strURL = "http://i.joyelectronics.com.cn/bodyscale1/loginoff.php"
            let params = ["email": emailText, "password": passWordText]
            Alamofire.request(strURL, method: .get, parameters: params)
                .responseString{response in
                    if let data = response.result.value{
                        print(data)
                    }
        }
    }
    
    //自动关闭提示框
    func autoAlertController (_ ErrorMsg: String){
        //设置提示框
        alertController = UIAlertController(title: ErrorMsg, message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
}
