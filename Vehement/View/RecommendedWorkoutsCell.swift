//
//  RecommendedWorkoutsCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 28/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation
import UIKit

class RecommendedWorkoutsCell: UICollectionViewCell {
    
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var workoutLevelLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!
    
    func updateViews(workout: Workout) {
        workoutImage.image = UIImage(named: workout.imageName)
        workoutNameLabel.text = workout.title
        workoutLevelLabel.text = workout.level
        workoutTypeLabel.text = workout.type
    }
    
}

