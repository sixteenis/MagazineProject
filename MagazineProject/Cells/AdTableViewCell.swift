//
//  AdTableViewCell.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var adLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
    let myColors: [UIColor] = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.purple, UIColor.lightGray, UIColor.brown]
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()
        
    }
    func setCell() {
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 10
        adLabel.layer.masksToBounds = true
        
        self.backgroundColor = getRandomColor()
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.opacity = 0.8
        
        mainLabel.font = .boldSystemFont(ofSize: 18)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = .black
        
        
    }
    func setData(data: Travel) {
        mainLabel.text = data.title
    }
    
    func getRandomColor() -> UIColor {
        let random = Int.random(in: 0...myColors.count-1)
        return myColors[random]
    }
    
    
    
    
}
