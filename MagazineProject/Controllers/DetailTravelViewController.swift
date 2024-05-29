//
//  DetailTravelViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/29/24.
//

import UIKit

class DetailTravelViewController: UIViewController {
    @IBOutlet var dissButton: UIButton!
    
    @IBOutlet var travelTitle: UILabel!
    
    
    var model: Travel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    //관광지: Push
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let model = model else {return}
        if model.ad {
            
            self.navigationItem.title = "광고 화면"
            travelTitle.text = model.title
            
        }else{
            //lessthan
            self.navigationItem.leftBarButtonItem?.tintColor = .black
            self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(popButtonTapped)), animated: true)
            self.navigationItem.title = model.title
            
            travelTitle.text = model.description
            dissButton.isHidden = true
        }
    }
    
    func setUpView() {
        navigationItem.title = "도시 화면"
        accessibilityNavigationStyle = .separate
        
        dissButton.setTitle("", for: .normal)
        dissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dissButton.tintColor = .black
    }
    @objc func popButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func dissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
