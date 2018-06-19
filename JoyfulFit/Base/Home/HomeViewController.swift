//
//  HomeViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/15.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
//定义获取屏幕宽度
let S_WIDTH: CGFloat = UIScreen.main.bounds.size.width
//定义获取屏幕高度
let S_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

//主页视图控制类
class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    //绑定CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    //绑定PageControl
    @IBOutlet weak var pageControl: UIPageControl!
    //定义变量保存当前用户的Id
    var  userId:String = ""
    //定义变量保存当前用户的admin_user
    var admin_User:String = ""
    //获取UserConfig的Email
//    var email:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置CollectionView委托和数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //设置UIPageControl的个数
        pageControl.numberOfPages = UserDao.findAll().count
        showCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //collectionView的委托
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserDao.findAll().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserinfoCollectionViewCell
        //查询用户数据
        let user = UserDao.findAll()
        //为当前的Cell设置用户名
        cell.userName.text! = user[indexPath.row].username
        
        //获取当前cell的id赋值给userId
        userId = user[indexPath.row].id
        //获取当前cell的admin_user赋值给admin_User
        admin_User = user[indexPath.row].admin_user
        return cell
    }
    
   //去到编辑用户页面
    @IBAction func toUpdateUserInfo(_ sender: Any) {
        //点击按钮的时候重新将userId的值赋值
        self.collectionView.reloadData()
        self.performSegue(withIdentifier: "toUpdateUserInfo", sender: userId)
    }
    
    //传递数据
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUpdateUserInfo"{
            let controller = segue.destination as! UpdateUserInfoViewController
            controller.userId = sender as! String
        }
    }
    
    //执行删除用户
    @IBAction func doDeleteUser(_ sender: Any) {
        //点击删除按钮的时候刷新数据
        self.collectionView.reloadData()
        if admin_User != "0" {               //当前用户不是主用户
            //点击删除按钮弹出提示框
            let alertController = UIAlertController(title: "删除用户", message: "是否删除该用户", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let deletetAction = UIAlertAction(title: "删除", style: .destructive, handler: {
                action in
                //根据当前显示用户的Id进行删除
                UserDao.deleteUser(Id: self.userId)
                //重新刷新用户列表和圆点个数
                self.collectionView.reloadData()
                self.pageControl.numberOfPages = UserDao.findAll().count
                self.showCollectionView()
            })
            alertController.addAction(cancelAction)
            alertController.addAction(deletetAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "删除用户", message: "当前用户是主用户不能被删除", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            }
        }
    
    //实现UIScrollViewDelegate委托协议
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x / S_WIDTH)
    }
    
  
    //实现UIPageController事件处理
    @IBAction func changePage(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            let whichPage = self.pageControl.currentPage
            self.collectionView.contentOffset = CGPoint(x: S_WIDTH * CGFloat(whichPage), y: 0)
        })
    }
    

    
   //创建CollectionView
    func showCollectionView(){
        let layout = UICollectionViewFlowLayout()
        let cellHeight = collectionView.frame.size.height
        let cellWidth = self.view.frame.size.width
        layout.itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    
}

    

