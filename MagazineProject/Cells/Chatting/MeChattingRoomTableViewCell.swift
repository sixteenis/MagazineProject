//
//  MeChattingRoomTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 6/2/24.
//

import UIKit

class MeChattingRoomTableViewCell: UITableViewCell {
    @IBOutlet var chattingLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        chattingLabel.layer.cornerRadius = chattingLabel.frame.width / 0.5
        
    }
    func setUpCell() {
        chattingLabel.textColor = .black
        chattingLabel.numberOfLines = 0
        chattingLabel.font = .systemFont(ofSize: 14)
        chattingLabel.textAlignment = .left
        chattingLabel.layer.borderColor = UIColor.black.cgColor
        chattingLabel.layer.borderWidth = 1
        chattingLabel.layer.backgroundColor = UIColor.lightGray.cgColor
        
        dateLabel.textColor = .lightGray
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
        
        
    }
    
    func setUpCellData(data: Chat) {
        chattingLabel.text = data.message
        
        dateLabel.text = data.date
    }
    
}
