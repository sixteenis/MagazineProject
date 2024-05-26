//
//  RestaurantTableViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    let restaurantArr = RestaurantList().restaurantArray
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tableView.rowHeight = 600

    }
    func setView() {
        searchTextField.placeholder = "식당 이름을 입력해주세요."
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        buttonSet(button: button1, title: "한식")
        buttonSet(button: button2, title: "일식")
        buttonSet(button: button3, title: "그외")
        
        
    }
    func buttonSet(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        let data = restaurantArr[indexPath.row]
        let url = URL(string: data.image)
        
        cell.mainImage.kf.setImage(with: url)
        cell.mainImage.layer.cornerRadius = 10
        
        cell.mainLabel.text = "이름: \(data.name) 가격: \(data.price)원"
        cell.mainLabel.textColor = .black
        cell.mainLabel.textAlignment = .left
        cell.mainLabel.numberOfLines = 2
        cell.mainLabel.font = .boldSystemFont(ofSize: 18)

        cell.subLabel1.text = "주소: \(data.address)"
        cell.subLabel1.textColor = .black
        cell.subLabel1.textAlignment = .left
        cell.subLabel1.numberOfLines = 1
        cell.subLabel1.font = .systemFont(ofSize: 14)
        
        cell.subLabel2.text = "전화번호: \(data.phoneNumber)"
        cell.subLabel2.textColor = .black
        cell.subLabel2.textAlignment = .left
        cell.subLabel2.numberOfLines = 1
        cell.subLabel2.font = .systemFont(ofSize: 14)

        return cell
        
    }



}
