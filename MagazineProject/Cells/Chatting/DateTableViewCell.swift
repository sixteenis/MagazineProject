//
//  DateTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 6/4/24.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .black
        dateLabel.textAlignment = .center
    }
    
    func setupDateCell(data: Chat) {
        
    }

    
    
}
