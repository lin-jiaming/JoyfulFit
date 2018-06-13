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
            if emailText == ""{                                     //判断邮箱输入框是否为空
                self.autoAlertController("邮箱不能为空!")
            } else if passWordText == ""{                            //判断密码输入框是否为空
                self.autoAlertController("密码不能为空!")
            } else {
                //请求查询用户列表Api
                let strURL = "http://i.joyelectronics.com.cn/bodyscale1/syn_initial.php"
                let params = ["email": emailText]
                Alamofire.request(strURL, method: .get, parameters: params)
                    .responseArray { (response: DataResponse<[UserModel]>) in
                        if let data = response.result.value{
                            if data != []{                             //判断服务器返回的数据不为空
                                if passWordText == data[0].password {   //校验密码是否匹配
                                    //将查询到的数据保存到本地数据库中
                                    UserDao.addUsers(objects: data)
                                    print(UserDao.findAll())
                                    //将登录邮箱保存到UserConfig数据表中
                                    let userConfig = UserConfig()
                                    userConfig.email = data[0].email
                                    UserConfigDao.addUserConfig(object: userConfig)
                                    print(UserConfigDao.findAll())
                                    //收回键盘
                                    self.passWordTxtField.resignFirstResponder()
                                    //提示登录成功
                                    self.autoAlertController("登录成功!")
                                    //登录成功！延时跳转到主页面
                                    let thread:Thread = Thread{
                                        Thread.sleep(forTimeInterval: 1.5)
                                        self.performSegue(withIdentifier: "doLogin", sender: self)
                                    }
                                    thread.start()
                                } else {
                                    self.autoAlertController("密码不正确!")
                                    self.passWordTxtField.text! = ""
                                }
                            }else {                                    //服务器返回的数据为空，则登录失败
                                self.autoAlertController("没有这个用户存在！")
                            }
                        }
                }
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
