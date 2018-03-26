//
//  WorkoutsTableCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 26/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation
import UIKit

class WorkoutsTableCell: UITableViewCell {
    
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var timeLengthLabel: UILabel!
    
    func updateViews(workout: Workout) {
        workoutImage.image = UIImage(named: workout.imageName)
        workoutLabel.text = workout.title
        timeLengthLabel.text = workout.timeLength
    }
    
    
}
