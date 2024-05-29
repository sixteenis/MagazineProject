//
//  TravelViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/27/24.
//

import UIKit

class TravelViewController: UIViewController {
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
    
    func setView() {
        headLabel.headSet(title: "도시 상세 정보")
        
        lineLabel.lineSet()
        
        loveFilterButton.setTitle("", for: .normal)
        loveFilterButton.setImage(UIImage(systemName: "heart"), for: .normal)
        loveFilterButton.tintColor = .red
        loveFilterButton.addTarget(self, action: #selector(loveButtonTapped), for: .touchUpInside)
    }
    
    @objc func loveTappend(_ sender: UIButton) { //한 셀의 하트모양 클릭
        for i in 0..<travelArr.count{
            if travelArr[i].id == sender.tag{
                travelArr[i].like?.toggle()
                print(travelArr[i].id)
                break
            }   
            
        }
        if likeBool{
            filterdArr = travelArr.filter{
                guard let like = $0.like else { return true}
                 return like ? true : false
            }
        }else{
            filterdArr = travelArr
        }
        travelTableView.reloadData()
    }
    
    @objc func loveButtonTapped() { //하트모양을 통해 필터 하는 기능
        likeBool.toggle()
        if likeBool{
            filterdArr = travelArr.filter{
                guard let like = $0.like else { return true}
                 return like ? true : false
            }
        }else{
            filterdArr = travelArr
        }
        likeBool ? loveFilterButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : loveFilterButton.setImage(UIImage(systemName: "heart"), for: .normal)
        travelTableView.reloadData()
    }


}


extension TravelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filterdArr[indexPath.row]
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell") as! AdTableViewCell
            cell.setData(data: data)
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as! TravelTableViewCell
            cell.setData(data: data)
            cell.loveButton.addTarget(self, action: #selector(loveTappend), for: .touchUpInside)
            cell.loveButton.tag = data.id
            print(cell.loveButton.tag)
            
            return cell
        }
    }
}
extension TravelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = filterdArr[indexPath.row]
        if data.ad {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTravelViewController") as! DetailTravelViewController
            //let nav = UINavigationController(rootViewController: vc)
            vc.model = data
            present(vc, animated: true)
            
            
        }else{
            //관광지: Push
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "DetailTravelViewController") as! DetailTravelViewController
            vc.model = data
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}
