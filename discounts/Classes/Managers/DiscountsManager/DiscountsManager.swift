//
//  DiscountsManager.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation

class DiscountsManager {
   
    static let sharedInstance = DiscountsManager()
    
    var discountsArrayData = Array<CompanyObject>()
    var discountsCategoryArrayData = Array<CompanyObject>()

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
    
    func loadDataFromJSON(_ filename: String)
    {
        if(discountsArrayData.count > 0)
        {
            return;
        }
        if let dictionary = self.loadJSONFromBundle(filename)
        {
            if let companysArray = dictionary["companys"] as? NSArray {
                for (_, element) in companysArray.enumerated() {
                    if let element = element as? NSDictionary {
                        var discount:CompanyObject = CompanyObject()
                        
                        // we convert each key to a String
                        discount.categoryId = element.value(forKey: "categoryId") as! Int
                        discount.categoryId = element.value(forKey: "categoryId") as! Int
                        discount.companyName = element.value(forKey: "companyName") as! String
                        discount.discount = element.value(forKey: "discount") as! String
                        discount.imageName = element.value(forKey: "imageName") as! String
                        discount.discountCode = element.value(forKey: "discountCode") as! String
                        discountsArrayData.append(discount)
                    }
                }
            }
        }
    }
    
    func getCompanyWithCategory(_ categoryIndex: Int)
    {
        if(discountsCategoryArrayData.count > 0)
        {
            discountsCategoryArrayData.removeAll(keepingCapacity: false)
            discountsCategoryArrayData = Array<CompanyObject>()
        }
        print("\n array count: \(discountsCategoryArrayData.count) \n")
        for i in 0 ..< discountsArrayData.count {
           var discount:CompanyObject = discountsArrayData[i]
            if(discount.categoryId == categoryIndex)
            {
               discountsCategoryArrayData.append(discount)
            }
        }
        print("\n array count: \(discountsCategoryArrayData.count) \n")
        print(discountsCategoryArrayData)
    }
    
}