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
        guard let dictionary = self.loadJSONFromBundle(filename) else {
            return
        }
        
        guard let categoryArray = dictionary["category"] as? NSArray else {
            return
        }
        
        for (_, element) in categoryArray.enumerated() {
            
            guard let element = element as? NSDictionary else {
                return
            }
            
            var category:CategoryObject = CategoryObject()
            
            // we convert each key to a String
            category.categoryId = element.value(forKey: "categoryId") as! Int
            category.categoryName = element.value(forKey: "categoryName") as! String
            category.categoryImageName = element.value(forKey: "categoryImageName") as! String
            categoryArrayData.append(category)
        }
        
    }
}
