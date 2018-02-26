//
//  MealTableViewController.swift
//  hello-ios
//
//  Created by TenTen on 2/26/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    
    var meals = [Dictionary<String, Any>]()
    let showMealDetailSegueIdentifier = "ShowMealDetailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        addMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? MealTableViewCell else {
            fatalError("Not an instance of MealTableViewCell")
        }
        
        let meal: Dictionary = meals[indexPath.row]
        
        let mealName = meal["name"] as? String
        let mealImage = meal["image"] as? UIImage
        
        cell.nameLabel.text = mealName
        cell.mealImageView.image = mealImage
        
        return cell
    }
    
    private func addMeals() {
        meals.append(["image": UIImage(named: "defaultPhoto")!, "name": "meal 1"])
        meals.append(["image": UIImage(named: "defaultPhoto")!, "name": "meal 2"])
        meals.append(["image": UIImage(named: "defaultPhoto")!, "name": "meal 3"])
    }
    
    @IBAction func unwindMeal(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController,let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == showMealDetailSegueIdentifier,
            let destination = segue.destination as? MealDetailViewController,
            let mealIndex = tableView.indexPathForSelectedRow?.row else {
                let log = "identifier: \(String(describing: segue.identifier)) destination: \(segue.destination) mealIndex: \(String(describing: tableView.indexPathForSelectedRow?.row))"
                
                print(log)
                return
        }
        
        destination.meal = meals[mealIndex]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
