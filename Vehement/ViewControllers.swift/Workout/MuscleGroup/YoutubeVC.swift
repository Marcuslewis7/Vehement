//
//  YoutubeVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 31/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import YouTubePlayer
import WebKit


class YoutubeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var pauseButton: TimerButtonRounded!
    @IBOutlet weak var resumeButton: TimerButtonRounded!
    @IBOutlet weak var myView: UIView!
    @IBOutlet var videoPlayer: YouTubePlayerView!
    @IBOutlet weak var videoTableView: UITableView!
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    var pulsatingLayer: CAShapeLayer!
    
    var myString = String()
    var myButtonChoiceString2 = String()
    
    lazy var time:Int = (Int(myString)!*60)
    var timer = Timer()
    var secondTime = 60
    var secondTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Slide", style: .plain, target: self, action: nil)
        
        videoPlayer.loadVideoID("_kAlQ5Bh5aY?playsinline=1")
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        percentageCompleteCirlce()
        
        minuteLabel.text = myString
        
        resumeButtonTapped()
        
        videoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if myButtonChoiceString2 == "BACK" {
            return DataService.instance.getBackWorkouts().count
        } else if myButtonChoiceString2 == "SHOULDERS" {
            return DataService.instance.getShoulderWorkouts().count
        } else if myButtonChoiceString2 == "CHEST" {
            return DataService.instance.getChestWorkouts().count
        } else if myButtonChoiceString2 == "TRICEPS" {
            return DataService.instance.getTricepWorkouts().count
        } else if myButtonChoiceString2 == "BICEPS" {
            return DataService.instance.getBicepWorkouts().count
        } else if myButtonChoiceString2 == "ABS" {
            return DataService.instance.getAbdominalWorkouts().count
        } else {
            return 10
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutsTableCell") as? WorkoutsTableCell {
            //var workout = DataService.instance.getBackWorkouts()[indexPath.row]
            if myButtonChoiceString2 == "BACK" {
                let workout = DataService.instance.getBackWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            } else if myButtonChoiceString2 == "SHOULDERS" {
                let workout = DataService.instance.getShoulderWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            } else if myButtonChoiceString2 == "CHEST" {
                let workout = DataService.instance.getChestWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            } else if myButtonChoiceString2 == "TRICEPS" {
                let workout = DataService.instance.getTricepWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            } else if myButtonChoiceString2 == "BICEPS" {
                let workout = DataService.instance.getBicepWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            } else if myButtonChoiceString2 == "ABS" {
                let workout = DataService.instance.getAbdominalWorkouts()[indexPath.row]
                cell.updateViews(workout: workout)
            }
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if myButtonChoiceString2 == "BACK" {
            let myCellChoice = DataService.instance.backWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        } else if myButtonChoiceString2 == "SHOULDERS" {
            let myCellChoice = DataService.instance.shoulderWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        } else if myButtonChoiceString2 == "CHEST" {
            let myCellChoice = DataService.instance.chestWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        } else if myButtonChoiceString2 == "BICEPS" {
            let myCellChoice = DataService.instance.bicepWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        } else if myButtonChoiceString2 == "TRICEPS" {
            let myCellChoice = DataService.instance.tricepWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        } else if myButtonChoiceString2 == "ABS" {
            let myCellChoice = DataService.instance.abdominalWorkouts[indexPath.row]
            videoPlayer.loadVideoID(myCellChoice.videoCode)
        }
    }
    
    func resumeButtonTapped() {
        if pauseButton.isSelected {
            timer.invalidate()
            secondTimer.invalidate()
            
        } else {
            timer.invalidate()
            secondTimer.invalidate()
            secondTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(YoutubeVC.action), userInfo: nil, repeats: true)
            timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(YoutubeVC.action), userInfo: nil, repeats: true)
        }
    }
 
    @IBAction func resumeButtonPressed(_ sender: Any) {
        timer.invalidate()
        secondTimer.invalidate()
        secondTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(YoutubeVC.action), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(YoutubeVC.action), userInfo: nil, repeats: true)
        resumeLayer(layer: pulsatingLayer)
        resumeLayer(layer: shapeLayer)
        videoPlayer.play()
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        timer.invalidate()
        secondTimer.invalidate()
        pauseLayer(layer: pulsatingLayer)
        pauseLayer(layer: shapeLayer)
        videoPlayer.pause()
    }
    
    @objc func action() {
        time -= 1
        secondTime -= 1
        minuteLabel.text = String(time/60)
        secondLabel.text = String(secondTime)
        if secondTime == 0 {
            secondTime += 60
        }
    }
    
    
    func percentageCompleteCirlce() {
        //centre the circle and path in view
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 70, startAngle: 3 * CGFloat.pi / 2, endAngle: -CGFloat.pi / 2, clockwise: false)
        
        //pulsates
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 1)
        pulsatingLayer.lineWidth = 15
        pulsatingLayer.fillColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
        pulsatingLayer.lineCap = kCALineCapRound
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.12
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: "pulsing")
        
        //create track
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        
        
        //create path
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapSquare
        shapeLayer.strokeEnd = 0
        
        //starts track colouring on path
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 60
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.repeatCount = Float.infinity
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        //layer order
        myView.layer.addSublayer(pulsatingLayer)
        myView.layer.addSublayer(trackLayer)
        myView.layer.addSublayer(shapeLayer)
        
    }
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    
    
}
