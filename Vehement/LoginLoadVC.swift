//
//  ViewController.swift
//  Vehement
//
//  Created by Marcus Lewis on 05/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

/*import UIKit
@IBDesignable

class LoginLoadVC: UIViewController {
    
    //OUTLETS
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet var LoadVC: UIView!
    @IBOutlet weak var loadImageBG: UIImageView!
    @IBOutlet weak var loadLogoImage: RoundedImage!
    
    //ACTIONS
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    
    
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingScreen()
        hideLoadingScreen()
        percentageCompleteCirlce()
        
        applyMotionEffect(toView: loadImageBG,magnitude: 8)
        applyMotionEffect(toView: loadLogoImage,magnitude: 8)
    }
    
    //makes loading screen appear
    func showLoadingScreen() {
        LoadVC.center = view.center
        LoadVC.alpha = 0
        view.addSubview(LoadVC)
        UIView.animate(withDuration: 1.0, delay: 5.0, options: [], animations: {
            self.LoadVC.alpha = 1
        }) { (success) in
            self.hideLoadingScreen()
        }
    }
    
    //makes loading screen disappear
    func hideLoadingScreen() {
        UIView.animate(withDuration: 5.0) {
            self.LoadVC.alpha = 0
        }
    }
    
    func percentageCompleteCirlce() {
        //centre the circle and path in view
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        //create track
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.4596264983)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(trackLayer)
        
        //create path
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        //starts track colouring on path
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 5
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }
    
   //Parallex Effect
    func applyMotionEffect (toView: UIImageView, magnitude: Float) {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        view.addMotionEffect(group)
    }
    

    
    
    
}

*/
