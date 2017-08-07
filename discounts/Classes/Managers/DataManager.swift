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
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }

        guard let data = NSData(contentsOf: url) else {
            return nil
        }
        
        do {
            let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
            
            guard let dictionary = object as? [String: AnyObject] else {
                return nil
            }
            
            return dictionary
            
        } catch {
            print("Error!! Unable to parse  \(filename).json")
        }

        print("Error!! Unable to load  \(filename).json")
        
        return nil
    }
    
}
