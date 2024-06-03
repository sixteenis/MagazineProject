//
//  ChattingViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var profileTableView: UITableView!
    
    
    var model = MockChatList.mockChatList {
        didSet{
            profileTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpSearchBar()
        setUpNav()
    }
    func setUpTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        let oneXib = UINib(nibName: OneChattingTableViewCell.identifier, bundle: nil)
        let manyXib = UINib(nibName: ManyChattingTableViewCell.identifier, bundle: nil)
        profileTableView.register(oneXib, forCellReuseIdentifier: OneChattingTableViewCell.identifier)
        profileTableView.register(manyXib, forCellReuseIdentifier: ManyChattingTableViewCell.identifier)
        profileTableView.rowHeight = 80
        
    }
    func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "친구 이름을 검색해보세요!"
        
    }
    func setUpNav() {
        navigationItem.title = "TRAVEL TALK"
    }
    

}

// MARK: - TableView 델리게이트
extension ChattingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = model[indexPath.row]
        if data.chatroomImage.count == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: OneChattingTableViewCell.identifier) as! OneChattingTableViewCell
            cell.setUpCellData(data: data)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ManyChattingTableViewCell.identifier) as! ManyChattingTableViewCell
            
            cell.setupDataCell(data: data)
            return cell
            
        }
    }
    
    
}
extension ChattingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = model[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ChattingRoomViewController.identifier) as! ChattingRoomViewController
        vc.chattingId = data.chatroomId - 1
        tableView.reloadRows(at: [indexPath], with: .automatic)
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
}

// MARK: - SearchBar 델리게이트
extension ChattingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        model = MockChatList.mockChatList.filter{
            view.endEditing(true)
            for i in $0.chatroomImage{
                if i.contains(searchBar.text!){
                    return true
                }
            }
            return false
                //.chatroomImage.contains(searchBar.text!)
        }
        if model.isEmpty{
            model = MockChatList.mockChatList
        }
        searchBar.text = nil
        print(model)
    }
    
}
