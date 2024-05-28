//
//  RestaurantTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel1: UILabel!
    @IBOutlet var subLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCells()
    }
    private func setCells() {
        mainLabel.restaurantLabelSet(fontsize: 14)
        subLabel1.restaurantLabelSet(fontsize: 12)
        subLabel2.restaurantLabelSet(fontsize: 12)
        
        mainImage.layer.cornerRadius = 10
        mainImage.contentMode = .scaleAspectFill
    }
    func cellDataSet(data: Restaurant) {
        mainLabel.restaurantLabelDataSet(data.mainLabelText)
        subLabel1.restaurantLabelDataSet(data.addressLabelText)
        subLabel2.restaurantLabelDataSet(data.phoneNumLabelText)
        mainImage.kf.setImage(with: data.imageURL)
    }
}
