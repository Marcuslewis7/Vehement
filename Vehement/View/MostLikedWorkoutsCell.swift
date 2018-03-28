//
//  MostLikedWorkoutsCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 27/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation
import UIKit

class MostLikedWorkoutsCell: UICollectionViewCell {
    
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var workoutLikesLabel: UILabel!
    
    func updateViews(workout: Workout) {
        workoutImage.image = UIImage(named: workout.imageName)
        workoutNameLabel.text = workout.title
        workoutLikesLabel.text = workout.likes
    }
    
}
