//
//  CategoryView.swift
//  discounts
//
//  Created by Michael Bielodied on 9/10/14.
//  Copyright (c) 2014 Michael Bielodied. All rights reserved.
//

import UIKit


let cellIdent = "CategoryCell"

class CategoryView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var categoryView: UICollectionView!
    var owner:UIViewController!
    var selectedItem:Int!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    func setupView()
    {
        CategoryManager.sharedInstance.loadDataFromJSON("Category")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return CategoryManager.sharedInstance.categoryArrayData.count
    }

    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdent, for: indexPath) as! CategoryViewCell
        cell.categoryNameLabel.text  = CategoryManager.sharedInstance.categoryArrayData[indexPath.row].categoryName
        cell.categoryImageView.image  = UIImage(named: CategoryManager.sharedInstance.categoryArrayData[indexPath.row].categoryImageName)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedItem = indexPath.row
        owner?.performSegue(withIdentifier: "ShowMainMenu", sender: owner)
    }
  
    func getSelectedItem()->Int
    {
        return selectedItem
    }

}
