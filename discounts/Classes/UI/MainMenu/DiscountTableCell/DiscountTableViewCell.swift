//
//  DiscountTableViewCell.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    var company:CompanyObject?
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var discountLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell() {
       companyName.text = company?.companyName
        discountLabel.text = company?.discount
        discountLabel.adjustsFontSizeToFitWidth = true
        let fileName:String? = company?.imageName
        companyImageView.image = UIImage(named: fileName!)
    }

}
