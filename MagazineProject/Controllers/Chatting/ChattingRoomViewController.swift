//
//  ChattingRoomViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 6/1/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    
    var model: ChatRoom?
    
    @IBOutlet var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = model?.chatroomName
    }

}

//extension ChattingRoomViewController:
