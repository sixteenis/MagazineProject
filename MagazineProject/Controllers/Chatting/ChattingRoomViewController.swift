//
//  ChattingRoomViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 6/1/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    @IBOutlet var chattingTableView: UITableView!
    
    @IBOutlet var chattingTextField: UITextView!
    @IBOutlet var chattingButton: UIButton!
    @IBOutlet var chattingView: UIView!
    var chattingId = 0
    //var model: ChatRoom? //{
//        didSet{
//            if model != nil{
//                chattingTableView.reloadData()
//            }
//        }
   // }
    let placeholder = "메시지를 입력하세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpChattingView()
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
        chattingTableView.separatorStyle = .none
        
        navigationItem.title = MockChatList.mockChatList[chattingId].chatroomName

        //chattingTableView.rowHeight = 120
        
    }
    
    func setUpChattingView() {
        chattingTextField.text = ""
        chattingTextField.delegate = self
        
        chattingButton.setTitle("", for: .normal)
        chattingButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        chattingButton.addTarget(self, action: #selector(chattingButtonTapped), for: .touchUpInside)
    }
    @objc func chattingButtonTapped() {
//        for i in 0...MockChatList.mockChatList.count{
//            if model!.chatroomId == MockChatList.mockChatList[i].chatroomId{
//                MockChatList.mockChatList[i].chatList.append(Chat(user: .user, date: "123-123", message: chattingTextField.text))
//                print(model!.chatroomId)
//                print(MockChatList.mockChatList[i].chatroomId)
//                break
//            }
//        }
        MockChatList.mockChatList[chattingId].chatList.append(Chat(user: .user, date: "1111", message: chattingTextField.text))
        chattingTextField.text = placeholder
        chattingTableView.reloadData()
        
    }
    
}

// MARK: - 테이블뷰
extension ChattingRoomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockChatList.mockChatList[chattingId].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = MockChatList.mockChatList[chattingId].chatList[indexPath.row]
        //guard let data = chatModel.chatList[indexPath.row] else {return UITableViewCell()}
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

// MARK: - 텍스트뷰
extension ChattingRoomViewController: UITextViewDelegate{
    //텍스트가 바뀔때 마다
    func textViewDidChange(_ textView: UITextView) {
        //print("텍스트 바뀜")
    }
    //편집 시작, 커서 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == chattingTextField {
            if textView.textColor == UIColor.lightGray{
                textView.text = nil
                textView.textColor = .black
            }
        }
        print("시작")
    }
    //편집 끝, 커서 안보임
    func textViewDidEndEditing(_ textView: UITextView) {
        print("종료")
        if textView == chattingTextField {
            if textView.text.isEmpty{
                textView.text = placeholder
                textView.textColor = .lightGray
            }
        }
    }
}
