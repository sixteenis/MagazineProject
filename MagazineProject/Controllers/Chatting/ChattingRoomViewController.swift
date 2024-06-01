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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
