//
//  HomeViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/15.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit

//定义获取屏幕宽度
let S_WIDTH: CGFloat = UIScreen.main.bounds.size.width
//定义获取屏幕高度
let S_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

//主页控制类
class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    //绑定CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    //绑定PageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        let cellHeight = collectionView.frame.size.height
        let cellWidth = self.view.frame.size.width
        layout.itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //collectionView的委托
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath)
        return cell
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
    
   
    
    
}

    

