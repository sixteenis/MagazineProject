//
//  CityTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/29/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet var shadowImage: UIImageView!
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
    
//        backgroundImage.layer.shadowOffset = CGSize(width: 5, height: 5)
//        backgroundImage.layer.shadowOpacity = 0.7
//        backgroundImage.layer.shadowRadius = 5
//        backgroundImage.layer.shadowColor = UIColor.gray.cgColor
//        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        //let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        shadowImage.clipsToBounds = false
//        shadowImage.layer.shadowColor = UIColor.black.cgColor
//        shadowImage.layer.shadowOpacity = 1
//        shadowImage.layer.shadowOffset = CGSize.zero
//        shadowImage.layer.shadowRadius = 10
//        shadowImage.layer.shadowPath = UIBezierPath(roundedRect: shadowImage.bounds, cornerRadius: 10).cgPath
    
        backgroundImage.layer.cornerRadius = 20
        backgroundImage.layer.masksToBounds = true
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        backgroundImage.contentMode = .scaleAspectFill
        
        
//        shadowImage.layer.shadowOffset = CGSize(width: 50, height: 50)
//        shadowImage.layer.shadowOpacity = 0.7
//        //shadowImage.layer.shadowRadius = 5
//        //shadowImage.layer.shadowColor = UIColor..cgColor
//        shadowImage.translatesAutoresizingMaskIntoConstraints = false
    
        mainLabel.font = .boldSystemFont(ofSize: 20)
        mainLabel.textColor = .white
        mainLabel.textAlignment = .right
        
        subLabel.font = .systemFont(ofSize: 14)
        subLabel.textColor = .white
        subLabel.textAlignment = .left
        subLabel.backgroundColor = .black
        subLabel.layer.opacity = 0.7
    }

    func setupCellData(data: City) {
        
        backgroundImage.kf.setImage(with: data.image, placeholder: UIImage(systemName: "photo.fill"))
        
        mainLabel.text = data.city_name + " | " + data.city_english_name
        
        subLabel.text = "  \(data.city_explain)"
        
        
        
    }

    
}
