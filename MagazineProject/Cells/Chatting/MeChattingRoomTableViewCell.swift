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
    
    @IBOutlet var chattingView: UIView!
    
    
    @IBOutlet var compareDateLabel: UILabel!
    
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
        chattingLabel.textColor = .black
        chattingLabel.numberOfLines = 0
        chattingLabel.font = .systemFont(ofSize: 14)
        chattingLabel.textAlignment = .left
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .lightGray
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
        
        chattingView.backgroundColor = .systemGray5
        chattingView.layer.cornerRadius = 10
        chattingView.layer.borderColor = UIColor.lightGray.cgColor
        chattingView.layer.borderWidth = 1
        
        compareDateLabel.textAlignment = .center
        compareDateLabel.font = .systemFont(ofSize: 14)
        
    }
    
    func setUpCellData(data: Chat, compareDate: Int, yesterday: Bool) {
        chattingLabel.text = data.message
        
        dateLabel.text = data.chattingDate
        
        if compareDate == 0 {
            compareDateLabel.isHidden = true
        }else{
            if yesterday{
                compareDateLabel.text = "어제"
            }else{
                compareDateLabel.text = data.homedate
            }
            compareDateLabel.isHidden = false
        }
    }
    
}
