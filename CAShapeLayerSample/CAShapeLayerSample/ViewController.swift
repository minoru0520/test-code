//
//  ViewController.swift
//  CAShapeLayerSample
//
//  Created by AWANO MINORU on 2015/11/11.
//  Copyright © 2015年 awano corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 円のCALayer作成
        let ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor.blueColor().CGColor  // 輪郭は青色
        ovalShapeLayer.fillColor = UIColor.whiteColor().CGColor  // 図形の中の色は白色
//        ovalShapeLayer.lineWidth = 1.0  // 輪郭の線の太さは1.0pt
        ovalShapeLayer.lineWidth = 5.0  // 輪郭の線の太さは1.0pt
        ovalShapeLayer.lineDashPattern = [2, 3]
        
        // 図形は円形
        ovalShapeLayer.path = UIBezierPath(ovalInRect: CGRect(x: view.bounds.size.width/2, y: view.bounds.size.height/2, width: 100.0, height: 100.0)).CGPath
        
        // 作成したCALayerを画面に追加
        view.layer.addSublayer(ovalShapeLayer)
        
        // 輪郭の線をアニメーションする(くるくるする)
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -0.5
        strokeStartAnimation.toValue = 1.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 1.5
        strokeAnimationGroup.repeatDuration = CFTimeInterval.infinity
        strokeAnimationGroup.animations = [strokeStartAnimation,strokeEndAnimation]
        ovalShapeLayer.addAnimation(strokeAnimationGroup, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

