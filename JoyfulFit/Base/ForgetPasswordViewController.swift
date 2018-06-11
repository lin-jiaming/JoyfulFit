//
//  ForgetPasswordViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/17.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import Alamofire
//忘记密码视图控制器
class ForgetPasswordViewController: UIViewController,UITextFieldDelegate {
    //邮箱文本
    @IBOutlet weak var EmailTextView: UITextField!
   
    //提示框
    var alertController: UIAlertController! = nil
    
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
    
    //确认按钮事件
    @IBAction func onClick(_ sender: Any) {
        //验证邮箱的正则表达式
        let email = self.EmailTextView.text!
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regex)
        let isValid = predicate.evaluate(with: email)
        //判断邮箱是否为空
        if email == "" {
            autoAlertController("邮箱不能为空")
        }
        //判断邮箱格式是否正确
        if isValid == true{
            let strURL = "http://i.joyelectronics.com.cn/bodyscale1/password.php"
            let params = ["email" : email]
            Alamofire.request(strURL, method: .get, parameters: params)
            autoAlertController("已发送密码邮箱至您的邮箱，请注意查收")
            //延时跳转到登录页面
            let thread:Thread = Thread{
                Thread.sleep(forTimeInterval: 2)
                self.performSegue(withIdentifier: "UpdateSuccess", sender: self)
            }
            thread.start()
            
        }else {
            autoAlertController("邮箱格式错误")
        }
        
        
    }
    
    //自动关闭提示框
    func autoAlertController (_ ErrorMsg : String){
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
