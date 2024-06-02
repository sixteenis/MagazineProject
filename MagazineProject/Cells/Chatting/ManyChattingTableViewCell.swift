//
//  ManyChattingTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/31/24.
//

import UIKit

class ManyChattingTableViewCell: UITableViewCell {

    @IBOutlet var profile1: UIImageView!
    
    @IBOutlet var profile2: UIImageView!
    
    @IBOutlet var profile3: UIImageView!
    
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var profileTextLabel: UILabel!
    @IBOutlet var profileDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        profile1.layer.cornerRadius = profile1.frame.width / 2
    }
    func setUpCell() {
        profile1.contentMode = .scaleAspectFill
        profile1.clipsToBounds = true
        
        profile2.contentMode = .scaleAspectFill
        profile2.clipsToBounds = true
        
        profile3.contentMode = .scaleAspectFill
        profile3.clipsToBounds = true
        
        profileNameLabel.setUpchattingMainLabel(.black)
        
        profileTextLabel.setUpchattingMainLabel(.lightGray)
        
        profileDateLabel.setUpchattingMainLabel(.lightGray, alignment: .right)
    }
    
    func setupDataCell(data: ChatRoom) {
        profile1.image = UIImage(named: data.chatroomImage[0])
        profile2.image = UIImage(named: data.chatroomImage[1])
        profile3.image = UIImage(named: data.chatroomImage[2])
        
        profileNameLabel.text = data.chatroomName
        
        profileTextLabel.text = data.chatList.last!.message
        
        profileDateLabel.text = data.chatList.last?.date
    
        
    }
    
}
