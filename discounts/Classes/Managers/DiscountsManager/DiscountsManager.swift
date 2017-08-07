//
//  DiscountsManager.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation

class DiscountsManager: DataManager {
   
    static let sharedInstance = DiscountsManager()
    
    var discountsArrayData = Array<CompanyObject>()
    var discountsCategoryArrayData = Array<CompanyObject>()

    func loadDataFromJSON(_ filename: String)
    {
        
        guard let dictionary = self.loadJSONFromBundle(filename) else {
            return
        }

        guard let companysArray = dictionary["companys"] as? NSArray else {
            return
        }
        
        for (_, element) in companysArray.enumerated() {
            guard let element = element as? NSDictionary else {
                return
            }
            
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
    
    func getCompanyWithCategory(_ categoryIndex: Int)
    {
        if(!discountsCategoryArrayData.isEmpty)
        {
            discountsCategoryArrayData.removeAll(keepingCapacity: false)
            discountsCategoryArrayData = Array<CompanyObject>()
        }
        
        print("\n array count: \(discountsCategoryArrayData.count) \n")
        
        //for i in 0 ..< discountsArrayData.count {
        for (_, discount) in discountsArrayData.enumerated() {
            
            if(discount.categoryId == categoryIndex)
            {
               discountsCategoryArrayData.append(discount)
            }
        }
        print("\n array count: \(discountsCategoryArrayData.count) \n")
        print(discountsCategoryArrayData)
    }
    
}
