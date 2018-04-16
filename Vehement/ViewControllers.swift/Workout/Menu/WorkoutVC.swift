//
//  WorkoutVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var segueIdentifier = ["toAllWorkoutsVC","toFeaturedVC","toMyPlanVC","toOtherVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        displayWalkthroughs()
    }
    
    func displayWalkthroughs() {
        let userDefaults = UserDefaults.standard
        let displayedWalkthrough = userDefaults.bool(forKey: "DisplayedWalkthrough")
        if !displayedWalkthrough {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") {
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
             if indexPath.row == 0 { self.performSegue(withIdentifier: "toAllWorkoutsVC", sender: category)}
        else if indexPath.row == 1 { self.performSegue(withIdentifier: "toFeaturedVC", sender: category)}
        else if indexPath.row == 2 { self.performSegue(withIdentifier: "toMyPlanVC", sender: category)}
        else if indexPath.row == 3 { self.performSegue(withIdentifier: "toOtherVC", sender: category)}
        }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let AllWorkoutsVC = segue.destination as? AllWorkoutsVC {
            assert(sender as? Category != nil)
            AllWorkoutsVC.initWorkouts(category: sender as! Category)
        }
    }
    
    
    
}
