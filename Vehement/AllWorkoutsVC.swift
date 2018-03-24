//
//  AllWorkoutsVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class AllWorkoutsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var workoutsCollection: UICollectionView!
    
    private(set) public var workouts = [Workout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        workoutsCollection.dataSource = self
        workoutsCollection.delegate = self
    }

    func initWorkouts(category: Category) {
        workouts = DataService.instance.getWorkout(forCategoryTitle: category.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutsCell", for: indexPath) as? WorkoutsCell {
            let workout = workouts[indexPath.row]
            cell.updateViews(workout: workout)
            return cell
        } else {
            return WorkoutsCell()
        }
    }
    
    

}
