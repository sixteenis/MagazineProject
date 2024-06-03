//
//  ChattingRoomViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 6/1/24.
//

import UIKit

// TODO: 날짜가 달라졌을 때, 날짜 구분선 넣기
// TODO: 텍스트뷰 세줄까지 늘려보기


class ChattingRoomViewController: UIViewController {
    @IBOutlet var chattingTableView: UITableView!
    
    @IBOutlet var bottomCondtraint: NSLayoutConstraint!
    @IBOutlet var chattingTextField: UITextView!
    @IBOutlet var chattingButton: UIButton!
    @IBOutlet var chattingView: UIView!
    var chattingId = 0
    let placeholder = "메시지를 입력하세요"
    var isShowingKeybord = false
    var today: Int {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let result = format.string(from: date)
        return Int(result)!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpChattingView()
        setUpKeyboard()
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            scrollToBottom()
        }
    func scrollToBottom() {
           let lastRow = chattingTableView.numberOfRows(inSection: 0) - 1
           if lastRow >= 0 {
               let indexPath = IndexPath(row: lastRow, section: 0)
               chattingTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
           }
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        chattingTextField.text = placeholder
        chattingTextField.textColor = .lightGray
        chattingTableView.reloadData()
        
        
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
        let item = UIBarButtonItem(image: UIImage(systemName: "lessthan"),style: .plain,  target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = item
        
    }
    
    func setUpChattingView() {
        chattingTextField.text = placeholder
        chattingTextField.textColor = .lightGray
        chattingTextField.delegate = self
        chattingTextField.layer.backgroundColor = .none
        
        
        chattingView.layer.cornerRadius = 10
        chattingView.layer.backgroundColor = UIColor.systemGray5.cgColor
        
        chattingButton.setTitle("", for: .normal)
        chattingButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        chattingButton.addTarget(self, action: #selector(chattingButtonTapped), for: .touchUpInside)
        chattingButton.tintColor = UIColor.systemGray2
    }
    func setUpKeyboard() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardhide), name: UIResponder.keyboardWillHideNotification, object: nil)
        keyboardhidding()
    }
    
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func chattingButtonTapped() {
        //"2024-06-12 21:30"
        let date = Date()
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = myFormatter.string(from: date)
        
        MockChatList.mockChatList[chattingId].chatList.append(Chat(user: .user, date: dateString, message: chattingTextField.text))
        if !chattingTextField.text.isEmpty{
            chattingTextField.text = ""
            chattingTableView.reloadData()
        }
        
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = keyboardScreenEndFrame.height
        self.bottomCondtraint.constant = keyboardViewEndFrame - 70
    }
    @objc func keyboardhide(notification: Notification) {
        bottomCondtraint.constant = 0
    }
    func keyboardhidding() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardremove))
        self.view.addGestureRecognizer(tap)
    }
    @objc func keyboardremove() {
        view.endEditing(true)
        
    }
    
    
}

// MARK: - 테이블뷰
extension ChattingRoomViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockChatList.mockChatList[chattingId].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = MockChatList.mockChatList[chattingId].chatList[indexPath.row]
        var compareDate: Int = 0
        var yesterdayBool = false
        if indexPath.row != 0{
            compareDate = data.compareDate - MockChatList.mockChatList[chattingId].chatList[indexPath.row-1].compareDate//4 - 3
            if MockChatList.mockChatList[chattingId].chatList[indexPath.row-1].compareDate == today - 1{
                yesterdayBool = true
            }
        }
        if data.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: MeChattingRoomTableViewCell.identifier) as! MeChattingRoomTableViewCell
            cell.setUpCellData(data: data, compareDate: compareDate, yesterday: yesterdayBool)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersChattingRoomTableViewCell.identifier) as! OthersChattingRoomTableViewCell
            cell.setUpCellData(data: data, compareDate: compareDate, yesterday: yesterdayBool)
            
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
        
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = .black
        }
        
        print("시작")
    }
    //편집 끝, 커서 안보임
//    func textViewDidEndEditing(_ textView: UITextView) {
//        print("종료")
//        if textView == chattingTextField {
//            if textView.text.isEmpty{
//                textView.text = placeholder
//                textView.textColor = .lightGray
//            }
//        }
//    }
}
