//
//  CompanyObject.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation

struct CompanyObject {
    
    var companyId:Int = 0
    var categoryId:Int = 0
    var companyName:String = ""
    var discount:String = ""
    var imageName:String = ""
    var discountCode:String = ""
    
    init() {
        companyId = 0
        categoryId = 0
        companyName = ""
        discount = ""
        imageName = ""
        discountCode = ""
    }
 
}
