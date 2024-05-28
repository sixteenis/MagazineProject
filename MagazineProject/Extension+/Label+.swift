//
//  Label+.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

extension UILabel{
    func lineSet() {
        self.text = ""
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    func headSet(title: String) {
        self.text = title
        self.textColor = .black
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 18)
    }
    func restaurantLabelSet(fontsize: Int) {
        textColor = .black
        textAlignment = .left
        //numberOfLines = 0
        //font = .systemFont(ofSize: CGFloat(fontsize))
        //CGFloat
    }
    func restaurantLabelDataSet(_ title: String) {
        text = title
    }
}
