//
//  WorkoutPlanVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 28/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
@IBDesignable

class WorkoutPlanVC: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var minuteName: UILabel!
    @IBOutlet weak var minuteView: UIView!
    
    var myString = String()
    var myButtonChoiceString = String()
    var myButton = dropDownButton()
    var myWorkoutsButton = dropDownButton()
    var myStretchesButton = dropDownButton()
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minuteName.text = myString
        percentageCompleteCirlce()
        print(myButtonChoiceString)
        
        //Warmup button
        view.addSubview(myView)
        myButton = dropDownButton.init(frame: CGRect(x: 0,y: 0, width: 0, height: 0))
        myButton.setTitle("WARM UP ☟", for: .normal)
        myButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        self.view.addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.myView.topAnchor, constant: 38).isActive = true
        myButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
        myButton.dropView.dropDownOptions = ["Chest Expansions", "Side Arm Raises", "Dives", "Raised Arm Circles", "Overhead Punches", "Punches"]
        
        //stretches button
        myStretchesButton = dropDownButton.init(frame: CGRect(x: 0,y: 0, width: 0, height: 0))
        myStretchesButton.setTitle("STRETCHES ☟", for: .normal)
        myStretchesButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        myStretchesButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myStretchesButton)
        myStretchesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myStretchesButton.centerYAnchor.constraint(equalTo: self.myButton.dropView.bottomAnchor, constant: 38).isActive = true
        myStretchesButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        myStretchesButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
        myStretchesButton.dropView.dropDownOptions = ["Stretch 1", "Stretch 2", "Stretch 3", "Stretch 4", "Stretch 5", "Stretch 6"]
        
        //workouts button
        myWorkoutsButton = dropDownButton.init(frame: CGRect(x: 0,y: 0, width: 0, height: 0))
        myWorkoutsButton.setTitle("EXERCISES ☟", for: .normal)
        myWorkoutsButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myWorkoutsButton)
        myWorkoutsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myWorkoutsButton.centerYAnchor.constraint(equalTo: self.myStretchesButton.dropView.bottomAnchor, constant: 38).isActive = true
        myWorkoutsButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        myWorkoutsButton.heightAnchor.constraint(equalToConstant: 76).isActive = true
        if myButtonChoiceString == "BACK" {
            myWorkoutsButton.dropView.dropDownOptions = ["High Row", "Low Row", "Lateral Pull", "Close Grip", "Lateral Fly", "Bent Over Row", "Back Fly"]
        } else if myButtonChoiceString == "SHOULDERS" {
            myWorkoutsButton.dropView.dropDownOptions = ["Shoulder Press", "Dumbbell Press", "Shoulder Machine", "Plate Raise", "Shoulder Fly", "Face Pulls"]
        } else if myButtonChoiceString == "CHEST" {
            myWorkoutsButton.dropView.dropDownOptions = ["Chest Press", "Dumbbell Press", "Pectoral Fly", "Chest Machine", "Chest Incline", "Decline Chest", "Chest Flat"]
        } else if myButtonChoiceString == "BICEPS" {
            myWorkoutsButton.dropView.dropDownOptions = ["Bicep Machine", "Bicep Curl", "Preacher Curl", "Bicep Curl 2"]
        } else if myButtonChoiceString == "TRICEPS" {
            myWorkoutsButton.dropView.dropDownOptions = ["Tricep Machine", "Tricep Dips", "Tricep Pull Down Cable", "Tricep Pull Down Bar"]
        } else if myButtonChoiceString == "ABS" {
            myWorkoutsButton.dropView.dropDownOptions = ["Crunches", "Plank", "Russian Twist"]
        }
        
        myButton.setupDropView()
        myStretchesButton.setupDropView()
        myWorkoutsButton.setupDropView()
    }


    func percentageCompleteCirlce() {
        //centre the circle and path in view
        let center = minuteView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
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
        shapeLayer.fillColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 0.3613013698)
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        //starts track colouring on path
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 5
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var MuscleGroupWorkoutVC = segue.destination as! YoutubeVC
        MuscleGroupWorkoutVC.myString = myString
        MuscleGroupWorkoutVC.myButtonChoiceString2 = myButtonChoiceString
    }
    
    
}

protocol dropDownProtocol {
    func dropDownPressed(string: String)
}

class dropDownButton: UIButton, dropDownProtocol {
    func dropDownPressed(string: String) {
        //self.setTitle(String, for: .normal)
    }
    
    var dropView = dropDownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
        dropView = dropDownView.init(frame: CGRect(x: 0,y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: dropView)
    }
    
    func setupDropView() {
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            if self.dropView.tableView.contentSize.height > 300 {
                self.height.constant = 300
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownOptions = [String]()
    var tableView = UITableView()
    var delegate : dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
    }

}
