//
//  CityTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/29/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func setupCell() {
        backgroundImage.layer.cornerRadius = 20
        backgroundImage.layer.masksToBounds = true
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        backgroundImage.contentMode = .scaleAspectFill
        
        mainLabel.font = .boldSystemFont(ofSize: 20)
        mainLabel.textColor = .white
        mainLabel.textAlignment = .right
        
        subLabel.font = .systemFont(ofSize: 14)
        subLabel.textColor = .white
        subLabel.textAlignment = .left
        subLabel.backgroundColor = .black
        subLabel.layer.opacity = 0.7
        subLabel.layer.cornerRadius = 20
        subLabel.layer.masksToBounds = true
        subLabel.clipsToBounds = true
        subLabel.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
    }

    func setupCellData(data: City) {
        
        backgroundImage.kf.setImage(with: data.image, placeholder: UIImage(systemName: "photo.fill"))
        
        mainLabel.text = data.city_name + " | " + data.city_english_name
        
        subLabel.text = "  \(data.city_explain)"
        
        
        
    }

    
}
