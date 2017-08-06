//
//  CategoryViewController.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet var categoryView: CategoryView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.setupView()
        categoryView.owner = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ShowMainMenu") {
            let viewController:MainMenuViewController = segue.destination as! MainMenuViewController
                viewController.categoryIndex = CategoryManager.sharedInstance.categoryArrayData[categoryView.getSelectedItem()].categoryId
        }
    }

}
