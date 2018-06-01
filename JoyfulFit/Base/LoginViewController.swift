//
//  LoginViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/16.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController, UITextFieldDelegate{
    
    //实现textField的绑定
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var PassWordTxtField: UITextField!
    
    //提示框
    var alertController: UIAlertController! = nil
    
    //错误信息
    var ErrorMsg: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTxtField.delegate = self
        PassWordTxtField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //实现UITextFieldDelegate协议
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //判断是哪一个textField
        if textField == self.EmailTxtField {
            textField.resignFirstResponder() //收起键盘
            return true
        }else if textField == self.PassWordTxtField {
            textField.resignFirstResponder()  //收起键盘
            return true
        }
        return true
    }
    
    //实现触碰到键盘以为的地方都收起键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.EmailTxtField.resignFirstResponder()
        self.PassWordTxtField.resignFirstResponder()
    }
    
    //登录按钮事件
    @IBAction func doLogin(_ sender: Any) {
//        if (EmailTxtField.text != "" && PassWordTxtField.text != "") {
//            //登录成功跳转到主页面
//            self.performSegue(withIdentifier: "Login", sender: self)
//            let strURL = "http://i.joyelectronics.com.cn/bodyscale1/loginoff.php"
//            let params = ["email" : self.EmailTxtField.text!,"password" : self.PassWordTxtField.text!]
//            Alamofire.request(strURL, method: .get, parameters: params)
//                .responseString{response in
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//                    }}
//        } else {
//            //邮箱和密码都为空的时候弹出提示框
//            ErrorMsg = "邮箱和密码为空"
//            autoAlertController(ErrorMsg)
//
//        }
        //登录成功跳转到主页面
        self.performSegue(withIdentifier: "Login", sender: self)
    }
    
    //自动关闭提示框
    func autoAlertController (_ ErrorMsg: String){
        let ErrorMsg = ErrorMsg
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
