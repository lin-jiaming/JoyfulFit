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
    //提示框
    var alertController: UIAlertController! = nil
    
    
    
    //实例化一个对象
    var user = UserModel()
    
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
    @IBAction func toPerfectUserInfo(_ sender: Any) {
        //定义正则表达式验证邮箱
        let  regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate =  NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: email.text!)
       
       if self.email.text! == "" {               //判断邮箱输入框是否为空
            self.autoAlertController("邮箱不能为空！")
        }else if isValid == false {             //判断邮箱格式是否正确
        autoAlertController("邮箱格式不正确!")
        self.email.text! = ""
        }else if passWord.text! == "" {         //判断密码是不是为空
            self.autoAlertController("密码不能为空!")
        }else if confirmPassword.text! == "" {      //判断确认密码是不是为空
            self.autoAlertController("确认密码不能为空!")
        }else if confirmPassword.text! != passWord.text! {      //判断确认密码是不是和密码一致
            self.autoAlertController("密码不一致")
            self.confirmPassword.text! = ""
        }else {                                    //当所有输入框正确的时候
            //请求验证邮箱Api验证邮箱是否存在
        let strURL = "http://i.joyelectronics.com.cn/bodyscale1/check_email.php"
        let params = ["email" : self.email.text!]
        Alamofire.request(strURL, method: .get, parameters: params)
            .responseString { response in
                if let data =  response.result.value{
                   //判断Api的返回的回调
                    if data.contains("email_exist"){
                        self.autoAlertController("该邮箱已经存在!")
                        //提示邮箱已存在的同时就清空所有的输入框
                        self.email.text! = ""
                        self.passWord.text! = ""
                        self.confirmPassword.text! = ""
                    } else {    //如果没有存在就将该邮箱保存到user对象中
                        //将输入框的值保存给user
                        self.user.email = self.email.text!
                        self.user.password = self.passWord.text!
                        //保存为主用户
                        self.user.admin_user = "0"  //0=主用户，1=子用户
                        //跳转到完善用户信息的页面
                        self.performSegue(withIdentifier: "toPerfectUserInfo", sender: self.user)
                    }
                }
            }
        }
    }
    
    //传递user对象到完善信息视图
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPerfectUserInfo" {
            let controller = segue.destination as! PerfectUserInfoViewController
                controller.user = self.user
        }
    }
    
    //自动关闭提示框
    func autoAlertController (_ ErrorMsg: String){
        //设置提示框
        alertController = UIAlertController(title: ErrorMsg, message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
}
