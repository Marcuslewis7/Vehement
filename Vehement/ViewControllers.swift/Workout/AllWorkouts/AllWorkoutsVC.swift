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

var videocode = String()


class AllWorkoutsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var workoutsCollection: UICollectionView!
    private var tap: UITapGestureRecognizer!
    var workouts = [Workout]()
    var myPassVideoCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutsCollection.dataSource = self
        workoutsCollection.delegate = self
        //gestureRecognizer.setCancelsTouchesInView = false
        //UILongPressGestureRecognizer.isEnabled = false
        
        self.workoutsCollection.allowsSelection = true
        //let tapOnScreen: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "CheckTheTime")
        //tapOnScreen.cancelsTouchesInView = false
        //view.addGestureRecognizer(tapOnScreen)
        self.tap = UITapGestureRecognizer(target: self, action: Selector(("viewTapped:")))
        self.tap.delegate = self
        self.view.addGestureRecognizer(self.tap)
    }

    
    func initWorkouts(category: Category) {
        workouts = DataService.instance.getWorkout(forCategoryTitle: category.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = workoutsCollection.bounds.width/2.0
        let yourHeight = yourWidth
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutsCell", for: indexPath) as? WorkoutsCell {
            let workout = workouts[indexPath.row]
            cell.updateViews(workout: workout)
            print("this is my workouts: " + workout.videoCode)
            return cell
        } else {
            return WorkoutsCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chosenWorkout = DataService.instance.allWorkouts[indexPath.row]
        print("chosen videoCode: \(chosenWorkout.videoCode)")
        myPassVideoCode = chosenWorkout.videoCode
        print("this is my:  " + myPassVideoCode)//Note: this whole print does not appear in the console either
        videocode.append(myPassVideoCode)
        performSegue(withIdentifier: "onPlayPressed2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onPlayPressed2" {
            print("stored videoCode: \(myPassVideoCode)")
            let toNextVC = segue.destination as! VideoViewVC
            print(myPassVideoCode)
            toNextVC.myPassVideoCode = myPassVideoCode
        }
        
    }
 
   
    /////////Segues////////////
    //@IBAction func onPlayPressed(_ sender: Any) {
    //   performSegue(withIdentifier: "onPlayPressed", sender: self)
    //}

    
    //////// Pan Gestures ///////////////
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (otherGestureRecognizer is UIPanGestureRecognizer)
    }
 */
    // UIGestureRecognizerDelegate method
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: self.workoutsCollection) == true {
            return false
        }
        return true
    }
 
    

}
