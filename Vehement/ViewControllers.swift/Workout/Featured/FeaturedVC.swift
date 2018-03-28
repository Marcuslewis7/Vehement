//
//  FeaturedVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 27/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class FeaturedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    private(set) public var workouts = [Workout]()
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mostViewedWorkoutsCollection: UICollectionView!
    @IBOutlet weak var mostLikedWorkoutsCollection: UICollectionView!
    @IBOutlet weak var recommendedWorkoutsCollection: UICollectionView!
    @IBOutlet weak var muscleBuildingWorkoutsCollection: UICollectionView!
    @IBOutlet weak var bodyToningWorkoutsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mostViewedWorkoutsCollection.dataSource = self
        mostViewedWorkoutsCollection.delegate = self
        self.scrollView.addSubview(mostViewedWorkoutsCollection)

        mostLikedWorkoutsCollection.dataSource = self
        mostLikedWorkoutsCollection.delegate = self
        self.scrollView.addSubview(mostLikedWorkoutsCollection)
        
        recommendedWorkoutsCollection.dataSource = self
        recommendedWorkoutsCollection.delegate = self
        self.scrollView.addSubview(recommendedWorkoutsCollection)
        
        muscleBuildingWorkoutsCollection.dataSource = self
        muscleBuildingWorkoutsCollection.delegate = self
        self.scrollView.addSubview(muscleBuildingWorkoutsCollection)
        
        bodyToningWorkoutsCollection.dataSource = self
        bodyToningWorkoutsCollection.delegate = self
        self.scrollView.addSubview(bodyToningWorkoutsCollection)
        
    }
    
    //func initWorkouts(category: Category) {
    //    workouts = DataService.instance.getWorkout(forCategoryTitle: category.title)
    //}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mostViewedWorkoutsCollection {
            print("return ds.i.gmvw.c")
            return DataService.instance.getMostViewedWorkouts().count
        } else if collectionView == self.mostLikedWorkoutsCollection {
            print("return ds.i.gmlw.c")
            return DataService.instance.getMostLikedWorkouts().count
        } else if collectionView == self.recommendedWorkoutsCollection {
            print("return ds.i.gRw.c")
            return DataService.instance.getRecommendedWorkouts().count
        } else if collectionView == self.muscleBuildingWorkoutsCollection {
            print("return ds.i.gmbw.c")
            return DataService.instance.getMuscleBuildingWorkouts().count
        } else if collectionView == self.bodyToningWorkoutsCollection {
            print("return ds.i.gbtw.c")
            return DataService.instance.getBodyToningWorkouts().count
        } else {
            print("Return5")
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mostViewedWorkoutsCollection {
            if let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedWorkoutsCell", for: indexPath) as? FeaturedWorkoutsCell {
                let workout = DataService.instance.getMostViewedWorkouts()[indexPath.row]
                cellA.updateViews(workout: workout)
                print("CELL A")
                return cellA
            } else {
                print("GOT HERE1")
                return FeaturedWorkoutsCell()
            }
        } else if collectionView == self.mostLikedWorkoutsCollection {
            if let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "MostLikedWorkoutsCell", for: indexPath) as? MostLikedWorkoutsCell {
                let workout = DataService.instance.getMostLikedWorkouts()[indexPath.row]
                cellB.updateViews(workout: workout)
                print("CELL B")
                return cellB
            } else {
                print("GOT HERE2")
                return MostLikedWorkoutsCell()
            }
        } else if collectionView == self.recommendedWorkoutsCollection {
            if let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedWorkoutsCell", for: indexPath) as? RecommendedWorkoutsCell {
                let workout = DataService.instance.getRecommendedWorkouts()[indexPath.row]
                cellC.updateViews(workout: workout)
                print("CELL C")
                return cellC
            } else {
                print("GOT HERE3")
                return RecommendedWorkoutsCell()
            }
        } else if collectionView == self.muscleBuildingWorkoutsCollection {
            if let cellD = collectionView.dequeueReusableCell(withReuseIdentifier: "MuscleBuildingWorkoutsCell", for: indexPath) as? MuscleBuildingWorkoutsCell {
                let workout = DataService.instance.getMuscleBuildingWorkouts()[indexPath.row]
                cellD.updateViews(workout: workout)
                print("CELL D")
                return cellD
            } else {
                print("GOT HERE4")
                return MuscleBuildingWorkoutsCell()
            }
        } else if collectionView == self.bodyToningWorkoutsCollection {
            if let cellE = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyToningWorkoutsCell", for: indexPath) as? BodyToningWorkoutsCell {
                let workout = DataService.instance.getBodyToningWorkouts()[indexPath.row]
                cellE.updateViews(workout: workout)
                print("CELL E")
                return cellE
            } else {
                print("GOT HERE5")
                return BodyToningWorkoutsCell()
            }
        } else {
            print("FAIL")
            return FeaturedWorkoutsCell()
        }
    }

    @IBAction func onPlayPressed(_ sender: Any) {
        performSegue(withIdentifier: "onPlayPressed", sender: self)
    }
    
    
}
