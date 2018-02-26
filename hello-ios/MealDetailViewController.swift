//
//  MealDetailViewController.swift
//  hello-ios
//
//  Created by TenTen on 2/26/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    var meal: Dictionary<String, Any> = [:]
    
    override func viewWillAppear(_ animated: Bool) {
        print("meal name: \(meal["name"])")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
