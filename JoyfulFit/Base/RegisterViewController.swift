//
//  RegisterViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/23.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    //邮箱文本框
    @IBOutlet weak var Email: UITextField!
    //密码文本框
    @IBOutlet weak var PassWord: UITextField!
    //确认密码文本框
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //绑定文本框委托
        self.Email.delegate = self
        self.PassWord.delegate = self
        self.ConfirmPassword.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TextFieldDelegate委托方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //按return收起键盘
        if textField == self.Email {
           self.Email.resignFirstResponder()
            return true
        }else if textField == self.PassWord{
            self.PassWord.resignFirstResponder()
            return true
        }else {
            self.ConfirmPassword.resignFirstResponder()
            return true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.Email.resignFirstResponder()
        self.PassWord.resignFirstResponder()
        self.ConfirmPassword.resignFirstResponder()
    }
    
    //注册用户按钮事件
    
    @IBAction func doRegister(_ sender: Any) {
//        let object = UserModel()
//        object.id = "1"
//        object.email = self.Email.text!
//        object.password = self.PassWord.text!
//        if object.password != self.ConfirmPassword.text! {
//            print("密码不一致")
//        }
//        UserDao.addUser(object: object)
//        print("注册用户成功！")
        let realm = UserDao.dao.realm
         print(realm.configuration.fileURL ?? "")
        
//        let result  = UserDao.dao.findAll()
//        print(re)
        
    }
    
    //注册用户的方法
    
    
}
