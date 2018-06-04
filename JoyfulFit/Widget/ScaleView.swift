//
//  ScaleView.swift
//  JoyfulFit
//
//  Created by 林佳明 on 2018/6/4.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit

class ScaleView: UIView {

    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height+20), radius: self.frame.size.width / 2, startAngle: CGFloat(M_PI) * 0, endAngle: CGFloat(M_PI) * 2, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        self.layer.addSublayer(layer)
    }
 

}
