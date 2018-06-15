//
//  SettingViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/15.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
//设置视图控制器
class SettingViewController:UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //退出登录的按钮
    @IBAction func doLoginOut(_ sender: Any) {
        //退出提示框
        let alertController = UIAlertController(title: "", message: "是否继续退出登录", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let loginOutAction = UIAlertAction(title: "退出", style: .destructive, handler: {
            action in
            //将UserConfig中的数据清空
            UserConfigDao.deleteUserConfig()
            //清空用户数据
            UserDao.deleteAll()
            //返回登录页面
            self.performSegue(withIdentifier: "doLoginOut", sender: self)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(loginOutAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
