//
//  ChattingRoomViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 6/1/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    @IBOutlet var chattingTableView: UITableView!
    
    var model: ChatRoom? //{
//        didSet{
//            chattingTableView.reloadData()
//        }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    func setUpTableView(){
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        let meXib = UINib(nibName: MeChattingRoomTableViewCell.identifier, bundle: nil)
        let othersXib = UINib(nibName: OthersChattingRoomTableViewCell.identifier, bundle: nil)
        chattingTableView.register(meXib, forCellReuseIdentifier: MeChattingRoomTableViewCell.identifier)
        chattingTableView.register(othersXib, forCellReuseIdentifier: OthersChattingRoomTableViewCell.identifier)
        
        chattingTableView.estimatedRowHeight = 120.0
        chattingTableView.rowHeight = UITableView.automaticDimension
        //chattingTableView.rowHeight = 120
        
    }

}

extension ChattingRoomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = model?.chatList[indexPath.row] else {return UITableViewCell()}
        if data.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: MeChattingRoomTableViewCell.identifier) as! MeChattingRoomTableViewCell
            cell.setUpCellData(data: data)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersChattingRoomTableViewCell.identifier) as! OthersChattingRoomTableViewCell
            cell.setUpCellData(data: data)
            
            return cell
        }
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            
//            return UITableView.automaticDimension
//        }
    
}

extension ChattingRoomViewController: UITableViewDelegate{
    
}
