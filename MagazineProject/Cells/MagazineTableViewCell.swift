//
//  MagazineTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/26/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()
    }
    private func setCell() {
        mainImage.layer.cornerRadius = 10
        
        mainLabel.textColor = .black
        mainLabel.textAlignment = .left
        mainLabel.numberOfLines = 2
        mainLabel.font = .boldSystemFont(ofSize: 24)
        
        subLabel.textColor = .lightGray
        subLabel.textAlignment = .left
        subLabel.numberOfLines = 1
        subLabel.font = .systemFont(ofSize: 14)
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
        dateLabel.numberOfLines = 1
    }
    
    func cellDataSet(_ data: Magazine) {
        mainImage.kf.setImage(with: data.image)
        mainLabel.text = data.title
        subLabel.text = data.subtitle
        dateLabel.text = data.returnDate
    }
}
