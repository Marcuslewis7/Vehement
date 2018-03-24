//
//  WorkoutsCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class WorkoutsCell: UICollectionViewCell {
    
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutLabel: UILabel!
    
    func updateViews(workout: Workout) {
        workoutImage.image = UIImage(named: workout.imageName)
        workoutLabel.text = workout.title
    }
}
