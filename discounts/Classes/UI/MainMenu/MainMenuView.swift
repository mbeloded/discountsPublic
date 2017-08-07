//
//  MainMenuView.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation
import UIKit

let cellName = "CellIdent"

class MainMenuView: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak private var tableView: UITableView!
    
    var owner:UIViewController!
    var selectedIndex:Int!
    
    func setupView(_ categoryIndex:Int)
    {
        DiscountsManager.sharedInstance.loadDataFromJSON("Company")
        DiscountsManager.sharedInstance.getCompanyWithCategory(categoryIndex)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DiscountsManager.sharedInstance.discountsCategoryArrayData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:DiscountTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellName) as! DiscountTableViewCell
        let tmp_cmp:CompanyObject = DiscountsManager.sharedInstance.discountsCategoryArrayData[indexPath.row]
        
        cell.company = tmp_cmp
        cell.setupCell()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        owner?.performSegue(withIdentifier: "showDiscount", sender: owner)
    }
}
