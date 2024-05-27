//
//  TravelTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    @IBOutlet var mainImageVIew: UIImageView!
    @IBOutlet var loveButton: UIButton!
    
    
    @IBOutlet var star1: UIImageView!
    @IBOutlet var star2: UIImageView!
    @IBOutlet var star3: UIImageView!
    @IBOutlet var star4: UIImageView!
    @IBOutlet var star5: UIImageView!
    
    @IBOutlet var starAndSaveLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(){
        mainLabel.textAlignment = .left
        mainLabel.textColor = .black
        mainLabel.font = .boldSystemFont(ofSize: 16)
        
        subLabel.font = .systemFont(ofSize: 13)
        subLabel.textColor = .lightGray
        subLabel.textAlignment = .left
        
        starAndSaveLabel.textAlignment = .left
        starAndSaveLabel.textColor = .lightGray
        starAndSaveLabel.font = .systemFont(ofSize: 13)
        starAndSaveLabel.text = ""
        
        mainImageVIew.contentMode = .scaleAspectFill
        mainImageVIew.layer.cornerRadius = 10
        
        loveButton.setTitle("", for: .normal)
        loveButton.tintColor = .white
        
        setStar(star: star1)
        setStar(star: star2)
        setStar(star: star3)
        setStar(star: star4)
        setStar(star: star5)
    
        
        
    }
    func setStar(star: UIImageView) {
        star.image = UIImage(systemName: "star")
        star.tintColor = .systemYellow
    }
    func setData(data: Travel) {
        mainLabel.text = data.title
        
        subLabel.text = data.description
        
        if let url = URL(string: data.travel_image!){
            mainImageVIew.kf.setImage(with: url, placeholder: UIImage(systemName: "photo.fill"))
        }else{
            mainImageVIew.image = UIImage(systemName: "photo.fill")
        }
        let loveImage = data.like! ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        loveButton.setImage(loveImage, for: .normal)
        
        starAndSaveLabel.text = "(\(data.grade!)) " + "저장 \(data.save!.formatted())"
        let num = Int(data.grade! + 0.5)
        let star = [star1,star2,star3,star4,star5]
        for i in 0..<num {
            star[i]!.image = UIImage(systemName: "star.fill")
        }
        
    }
    
}
