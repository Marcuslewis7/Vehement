//
//  CategoryVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 11/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import CoreData
import SwipeCellKit
import ChameleonFramework

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myDayLabel: UILabel!
    @IBOutlet weak var myMonthLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = [Categoriey]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let request : NSFetchRequest<Categoriey> = Categoriey.fetchRequest()
        loadCategorys(with: request)
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCategoryCell") as? SwipeTableViewCell {
            let categorie = categories[indexPath.row]
            cell.textLabel?.text = categorie.name
            let myDate = String(categorie.day! + " " + categorie.month!)
            cell.detailTextLabel?.text = myDate
            cell.accessoryType = categorie.done ? .checkmark : .none
            cell.delegate = self
            if let color = UIColor.flatGray.darken(byPercentage: (CGFloat(indexPath.row)/CGFloat(categories.count))) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
                cell.detailTextLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            return cell
        } else {
            return ToDoItemCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toItemSegue", sender: self)
        categories[indexPath.row].done = !categories[indexPath.row].done
        self.saveCategorys()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListVC
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        var textField2 = UITextField()
        var textField3 = UITextField()
        let alert = UIAlertController(title: "Add New Goal", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Goal", style: .default) { (action) in
            
            let newCategory = Categoriey(context: self.context)
            newCategory.name = textField.text!
            newCategory.day = textField2.text!
            newCategory.month = textField3.text!
            newCategory.done = false
            self.categories.append(newCategory)
            self.saveCategorys()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Goal"
            textField = alertTextField
        }
        alert.addTextField { (alertTextField2) in
            alertTextField2.placeholder = "Target Date"
            textField2 = alertTextField2
        }
        
        alert.addTextField { (alertTextField3) in
            alertTextField3.placeholder = "Target Month"
            textField3 = alertTextField3
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategorys(){
        do{
            try context.save()
        } catch {
            print("error saving context")
        }
        self.tableView.reloadData()
    }
    
    func loadCategorys(with request: NSFetchRequest<Categoriey> = Categoriey.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data for context")
        }
    }
    
}

extension CategoryVC: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.context.delete(self.categories[indexPath.row])
            self.categories.remove(at: indexPath.row)
            self.saveCategorys()
        }
        deleteAction.image = UIImage(named: "deleteIcon")
        return [deleteAction]
    }
    
}
