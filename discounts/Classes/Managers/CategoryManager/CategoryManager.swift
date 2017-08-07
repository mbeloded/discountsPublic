//
//  CategoryManager.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation

class CategoryManager: DataManager {
    
    static let sharedInstance = CategoryManager()
    
    var categoryArrayData = Array<CategoryObject>()
    
    func loadDataFromJSON(_ filename: String)
    {
        if let dictionary = self.loadJSONFromBundle(filename)
        {
            if let categoryArray = dictionary["category"] as? NSArray {
                for (_, element) in categoryArray.enumerated() {
                    if let element = element as? NSDictionary {
                        let category:CategoryObject = CategoryObject()
                        
                        // we convert each key to a String
                        category.categoryId = element.value(forKey: "categoryId") as! Int
                        category.categoryName = element.value(forKey: "categoryName") as! String
                        category.categoryImageName = element.value(forKey: "categoryImageName") as! String
                        categoryArrayData.append(category)
                    }
                }
            }
        }
    }
}
