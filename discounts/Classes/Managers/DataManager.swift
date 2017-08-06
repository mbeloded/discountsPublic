//
//  DataManager.swift
//  discounts
//
//  Created by Michael Bielodied on 8/6/17.
//  Copyright © 2017 Michael Bielodied. All rights reserved.
//

import Foundation

class DataManager {

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
    
}
