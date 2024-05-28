//
//  MagazineTableViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/26/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleLine: UILabel!
    
    let travelArr = MagazineInfo.magazine
    let cellName = MagazineInfo.cellName
    
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

}


extension MagazineTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! MagazineTableViewCell
        let data = travelArr[indexPath.row]
        cell.cellDataSet(data)
        
        
        return cell
        
    }
}
