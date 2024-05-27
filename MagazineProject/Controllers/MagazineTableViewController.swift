//
//  MagazineTableViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/26/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    let travelArr = MagazineInfo().magazine
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleLine: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500
        setHeadView()
    }
    func setHeadView() {
        titleLabel.text = "성민 TRAVEL"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        titleLine.text = ""
        titleLine.layer.borderWidth = 1
        titleLine.layer.borderColor = UIColor.lightGray.cgColor
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        let data = travelArr[indexPath.row]
        let url = URL(string: data.photo_image)
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyMMdd"
        var mydate: String = ""
        if let date = inputFormatter.date(from: data.date) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yy년 MM월 dd일"
            
            mydate = outputFormatter.string(from: date)
        }
        
        cell.mainImage.kf.setImage(with: url)
        cell.mainImage.layer.cornerRadius = 10
        
        cell.mainLabel.text = data.title
        cell.mainLabel.textColor = .black
        cell.mainLabel.textAlignment = .left
        cell.mainLabel.numberOfLines = 2
        cell.mainLabel.font = .boldSystemFont(ofSize: 24)
        
        cell.subLabel.text = data.subtitle
        cell.subLabel.textColor = .lightGray
        cell.subLabel.textAlignment = .left
        cell.subLabel.numberOfLines = 1
        cell.subLabel.font = .systemFont(ofSize: 14)
        
        cell.dateLabel.text = mydate
        cell.dateLabel.font = .systemFont(ofSize: 13)
        cell.dateLabel.textColor = .lightGray
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.numberOfLines = 1
        return cell
        
    }


}
