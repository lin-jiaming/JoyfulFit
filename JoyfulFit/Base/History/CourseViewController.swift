//
//  CourseViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/15.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import UIKit
class CourseViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //绑定collectionView
    @IBOutlet weak var collectionView: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate =  self
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //collectionView委托
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeightCell", for: indexPath) as! HistoryCollectionViewCell
        // 根据实际的值计算出不同的高度
        cell.bodyWeightViewHeightConstraint.constant = 150;     //体重的值
        cell.bodyFatViewHeightConstraint.constant = 120;        //体脂的值
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //获取CollectionView的宽度
        let cellWidth = CGFloat(60)
        //获取CollectionView的高度
        let cellHeight = self.collectionView.frame.size.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
