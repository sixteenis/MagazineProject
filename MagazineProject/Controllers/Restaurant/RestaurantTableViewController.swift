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
        searchButton.tintColor = .black
        
        for i in 0..<foodType.count{
            buttonSet(button: subButtonArr[i], title: foodType[i])
            subButtonArr[i].tag = i
        }
        filterArr = restaurantArr
        
        navigationItem.title = "주변 맛집"
        let navitem = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(mapButtonTapped))
        navigationItem.rightBarButtonItem = navitem
        navigationItem.rightBarButtonItem?.tintColor = .black
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
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as! RestaurantTableViewCell
        let data = filterArr[indexPath.row]
        cell.cellDataSet(data: data)
        return cell
        
    }
    
    // MARK: - 지도 뷰로 이동하는 코드
    @objc func mapButtonTapped() {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //name: 파일명 , bundle: 내가 만든거면 nil
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: MapViewController.identifier) as! MapViewController
        // 3. 화면 띄우기
        navigationController?.pushViewController(vc, animated: true)
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
