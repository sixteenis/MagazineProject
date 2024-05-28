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
    @IBOutlet var subButtonArr: [UIButton]!
    
    let foodType = ["한식", "카페", "중식", "분식", "전부"]
    let restaurantArr = RestaurantList().restaurantArray
    var filterArr = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tableView.rowHeight = 160

    }
    func setView() {
        searchTextField.placeholder = "식당 이름을 입력해주세요."
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        for i in 0..<foodType.count{
            buttonSet(button: subButtonArr[i], title: foodType[i])
            subButtonArr[i].tag = i
        }
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
        cell.cellDataSet(data: data)
        return cell
        
    }

    @IBAction func textFieldEndDid(_ sender: UITextField) {
    }
    
    
    @IBAction func searchTextFiledEnd(_ sender: UITextField) {
        if !searchTextField.text!.isEmpty{
            filterArr = restaurantArr.filter{ $0.name.contains(searchTextField.text!)}
            tableView.reloadData()
            searchTextField.text = ""
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        if !searchTextField.text!.isEmpty{
            filterArr = restaurantArr.filter{ $0.name.contains(searchTextField.text!)}
            tableView.reloadData()
            searchTextField.text = ""
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        if foodType[sender.tag] == "전부"{
            filterArr = restaurantArr
        }else{
            filterArr = restaurantArr.filter { $0.category == foodType[sender.tag] }
        }
        tableView.reloadData()

        
    }
    
}
