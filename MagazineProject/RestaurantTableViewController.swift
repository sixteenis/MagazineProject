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
    @IBOutlet var button4: UIButton!
    
    let restaurantArr = RestaurantList().restaurantArray
    var filterArr = [Restaurant]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tableView.rowHeight = 200

    }
    func setView() {
        searchTextField.placeholder = "식당 이름을 입력해주세요."
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        buttonSet(button: button1, title: "한식")
        buttonSet(button: button2, title: "일식")
        buttonSet(button: button3, title: "그외")
        
        buttonSet(button: button4, title: "")
        button4.setImage(UIImage(systemName: "goforward"), for: .normal)
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        button4.tag = 3
        searchButton.tag = 4
        
        filterArr = restaurantArr
        
        
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
        return filterArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        let data = filterArr[indexPath.row]
        let url = URL(string: data.image)
        
        cell.mainImage.kf.setImage(with: url)
        cell.mainImage.layer.cornerRadius = 10
        cell.mainImage.contentMode = .scaleAspectFill
        
        cell.mainLabel.text = "\(data.name) \n가격: \(data.price)원"
        cell.mainLabel.textColor = .black
        cell.mainLabel.textAlignment = .left
        cell.mainLabel.numberOfLines = 0
        cell.mainLabel.font = .boldSystemFont(ofSize: 14)

        cell.subLabel1.text = "주소: \(data.address)"
        cell.subLabel1.textColor = .black
        cell.subLabel1.textAlignment = .left
        cell.subLabel1.numberOfLines = 0
        cell.subLabel1.font = .systemFont(ofSize: 12)
        
        cell.subLabel2.text = "전화번호: \(data.phoneNumber)"
        cell.subLabel2.textColor = .black
        cell.subLabel2.textAlignment = .left
        cell.subLabel2.numberOfLines = 0
        cell.subLabel2.font = .systemFont(ofSize: 12)

        return cell
        
    }

    @IBAction func textFieldEndDid(_ sender: UITextField) {
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            filterArr = restaurantArr.filter{$0.category == "한식"}
            tableView.reloadData()
        case 1:
            filterArr = restaurantArr.filter{$0.category == "일식"}
            tableView.reloadData()
        case 2:
            filterArr = restaurantArr.filter{$0.category != "한식" && $0.category != "일식"}
            tableView.reloadData()
        case 3:
            filterArr = restaurantArr
            tableView.reloadData()
        case 4:
            filterArr = []
            for item in restaurantArr{
                if item.name.contains(searchTextField.text!){
                    filterArr.append(item)
                }
            }
            tableView.reloadData()
        default:
            print("오류")
            
        }
    }
    
}
