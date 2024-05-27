//
//  TravelViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var headLabel: UILabel!
    @IBOutlet var lineLabel: UILabel!
    @IBOutlet var travelTableView: UITableView!
    @IBOutlet var loveFilterButton: UIButton!
    
    private var travelArr = TravelInfo().travel
    private var filterdArr = [Travel]()
    private var likeBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        travelTableView.rowHeight = 120
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let travelXib = UINib(nibName: "TravelTableViewCell", bundle: nil)
        let adXib = UINib(nibName: "AdTableViewCell", bundle: nil)
        travelTableView.register(travelXib, forCellReuseIdentifier: "TravelTableViewCell")
        travelTableView.register(adXib, forCellReuseIdentifier: "AdTableViewCell")
        filterdArr = travelArr
        
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filterdArr[indexPath.row]
        if data.ad! {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell") as! AdTableViewCell
            cell.setData(data: data)
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as! TravelTableViewCell
            cell.setData(data: data)
            cell.loveButton.addTarget(self, action: #selector(loveTappend), for: .touchUpInside)
            cell.loveButton.tag = indexPath.row
            
            return cell
        }
    }
    func setView() {
        headLabel.headSet(title: "도시 상세 정보")
        
        lineLabel.lineSet()
        
        loveFilterButton.setTitle("", for: .normal)
        loveFilterButton.setImage(UIImage(systemName: "heart"), for: .normal)
        loveFilterButton.tintColor = .red
        loveFilterButton.addTarget(self, action: #selector(loveButtonTapped), for: .touchUpInside)
    }
    @objc func loveTappend(_ sender: UIButton) {
        travelArr[sender.tag].like?.toggle()
        filterdArr = travelArr
        
        travelTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        
    }
    @objc func loveButtonTapped() {
        likeBool.toggle()
        if likeBool{
            filterdArr = travelArr.filter{ l in
            if let a = l.like {
                if a{
                    return true
                }else{
                    return false
                }
            }else{
                return true
            }
            
            
        }
        loveFilterButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        travelTableView.reloadData()
        }else{
        
            filterdArr = travelArr
            travelTableView.reloadData()
            loveFilterButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }


}
