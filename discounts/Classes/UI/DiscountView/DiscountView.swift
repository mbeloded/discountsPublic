//
//  DiscountView.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import Foundation
import UIKit
import RSBarcodes_Swift
import AVFoundation

class DiscountView: UIView {
    
    @IBOutlet weak private var codeImageView: UIImageView!
    @IBOutlet weak private var productImageLogoView: UIImageView!
    @IBOutlet weak private var productNameLabel: UILabel!
    
    func generateCode(_ productIndex:Int)
    {
        let companyObject:CompanyObject = DiscountsManager.sharedInstance.discountsCategoryArrayData[productIndex]
    
        productNameLabel.text = companyObject.companyName
        productImageLogoView.image = UIImage(named: companyObject.imageName)
        
        let codeImage:UIImage = RSCode128Generator(codeTable: .a).generateCode(companyObject.discountCode, machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code)!
        codeImageView.image = codeImage
        codeImageView.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        codeImageView.frame = CGRect(x: codeImageView.frame.origin.x, y: codeImageView.frame.origin.y, width: codeImage.size.width, height: codeImage.size.height)

    }
}
