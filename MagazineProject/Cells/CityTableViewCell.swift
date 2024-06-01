//
//  CityTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/29/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet var shadowContainerView: UIView!
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
        // shadowContainerView 설정
//        shadowContainerView.layer.cornerRadius = 20
//        shadowContainerView.layer.shadowColor = UIColor.black.cgColor
//        shadowContainerView.layer.shadowOpacity = 0.7
//        shadowContainerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        shadowContainerView.layer.shadowRadius = 4
//        shadowContainerView.layer.masksToBounds = false
        
        // backgroundImage 설정
        backgroundImage.layer.cornerRadius = 20
        backgroundImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        
        // mainLabel 설정
        mainLabel.font = .boldSystemFont(ofSize: 20)
        mainLabel.textColor = .white
        mainLabel.textAlignment = .right
        
        // subLabel 설정
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
