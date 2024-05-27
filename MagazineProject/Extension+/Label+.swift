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
}
