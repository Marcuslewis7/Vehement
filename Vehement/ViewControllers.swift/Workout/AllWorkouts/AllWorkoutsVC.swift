//
//  AllWorkoutsVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = workoutsCollection.bounds.width/2.0
        let yourHeight = yourWidth
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    /////////Segues/////////////
    @IBAction func onPlayPressed(_ sender: Any) {
        performSegue(withIdentifier: "onPlayPressed", sender: self)
    }
    
    //////// Pan Gestures ///////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (otherGestureRecognizer is UIPanGestureRecognizer)
    }
    

}
