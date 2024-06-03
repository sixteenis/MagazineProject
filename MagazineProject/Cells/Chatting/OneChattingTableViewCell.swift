//
//  OneChattingTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/31/24.
//

import UIKit

class OneChattingTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var profileTextLabel: UILabel!
    @IBOutlet var profileDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    func setUpCell() {
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        
        profileNameLabel.setUpchattingMainLabel(.black)
        
        profileTextLabel.setUpchattingMainLabel(.lightGray)
        
        profileDateLabel.setUpchattingMainLabel(.lightGray, alignment: .right)
    
    }
    
    func setUpCellData(data: ChatRoom) {
        profileImage.image = UIImage(named: data.chatroomImage[0])
        
        profileNameLabel.text = data.chatroomName
        
        profileTextLabel.text = data.chatList.last!.message
        
        profileDateLabel.text = data.chatList.last?.homedate
    
        
    }
    
}
