//
//  MuscleGroupVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 28/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class MuscleGroupVC: UIViewController {
    
    @IBOutlet weak var tricepButton: UIButton!
    @IBOutlet weak var absButton: UIButton!
    @IBOutlet weak var bicepButton: UIButton!
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var shoulderButton: UIButton!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createWorkoutButton: RoundedStartButton!
    var backButtonPressed = Bool()
    var shoulderButtonPressed = Bool()
    var chestButtonPressed = Bool()
    var bicepButtonPressed = Bool()
    var tricepButtonPressed = Bool()
    var absButtonPressed = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                backButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                backButtonPressed = false
                backButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                backButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                backButtonPressed = true
                backButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func shoulderButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                shoulderButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                shoulderButtonPressed = false
                shoulderButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                shoulderButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                shoulderButtonPressed = true
                shoulderButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func chestButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                chestButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                chestButtonPressed = false
                chestButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                chestButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                chestButtonPressed = true
                chestButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func bicepButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                bicepButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                bicepButtonPressed = false
                bicepButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                bicepButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                bicepButtonPressed = true
                bicepButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func absButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                absButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                absButtonPressed = false
                absButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                absButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                absButtonPressed = true
                absButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func tricepButtonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                createWorkoutButton.isEnabled = false
                tricepButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.3333333333, blue: 0.5568627451, alpha: 1)
                tricepButtonPressed = false
                tricepButton.isSelected = false
            } else {
                createWorkoutButton.isEnabled = true
                tricepButton.backgroundColor = #colorLiteral(red: 0.3640650511, green: 0.06639433652, blue: 0.9690285325, alpha: 1)
                tricepButtonPressed = true
                tricepButton.isSelected = true
                button.tintColor = .clear
            }
        }
    }
    
    @IBAction func changeTime(_ sender: Any) {
        minuteLabel.text = String(Int(roundf((mySlider.value)))*5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var workoutPlanVC = segue.destination as! WorkoutPlanVC
        workoutPlanVC.myString = String(Int(roundf((mySlider.value)))*5)
        if backButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (backButton.titleLabel?.text)!
        } else if shoulderButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (shoulderButton.titleLabel?.text)!
        } else if chestButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (chestButton.titleLabel?.text)!
        } else if bicepButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (bicepButton.titleLabel?.text)!
        } else if tricepButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (tricepButton.titleLabel?.text)!
        } else if absButtonPressed == true {
            workoutPlanVC.myButtonChoiceString = (absButton.titleLabel?.text)!
        }
    }

}
