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
    /*
    func loadJSONFromBundle(_ filename: String) -> [String: AnyObject]? {
        
        if let url = Bundle.main.url(forResource: filename, withExtension: "json")
        {
            if let data = NSData(contentsOf: url) {
                do {
                    let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                        return dictionary
                    }
                } catch {
                    print("Error!! Unable to parse  \(filename).json")
                }
            }
            print("Error!! Unable to load  \(filename).json")
        }
        return nil
    }
    */
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
