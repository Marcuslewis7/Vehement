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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
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
        performSegue(withIdentifier: "toAllWorkoutsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let AllWorkoutsVC = segue.destination as? AllWorkoutsVC {
            assert(sender as? Category != nil)
            AllWorkoutsVC.initWorkouts(category: sender as! Category)
        }
    }
    
    
    
}
