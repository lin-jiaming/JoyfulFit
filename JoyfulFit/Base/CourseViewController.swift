//
//  CourseViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/15.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import Foundation
import UIKit
class CourseViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeightCell", for: indexPath)
        return cell
    }
    
    
}
