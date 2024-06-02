//
//  OthersChattingRoomTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 6/2/24.
//

import UIKit

class OthersChattingRoomTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chattingLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    @IBOutlet var chattingView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        chattingLabel.layer.cornerRadius = chattingLabel.frame.width / 0.5
//        
//    }

    func setUpCell() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 1
        nameLabel.font = .boldSystemFont(ofSize: 14)
        
        chattingLabel.textColor = .black
        chattingLabel.numberOfLines = 0
        chattingLabel.font = .systemFont(ofSize: 14)
        chattingLabel.textAlignment = .left
        
        chattingView.backgroundColor = .white
        chattingView.layer.cornerRadius = 10
        chattingView.layer.borderColor = UIColor.lightGray.cgColor
        chattingView.layer.borderWidth = 1
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .lightGray
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .left
    }
    
    func setUpCellData(data: Chat) {
        profileImage.image = UIImage(named: data.user.profileImage)
        
        nameLabel.text = data.user.profileImage
        
        chattingLabel.text = data.message
        
        dateLabel.text = data.date
    }
    
}
