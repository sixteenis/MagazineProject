//
//  CityViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/29/24.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet var citySegment: UISegmentedControl!
    @IBOutlet var cityTabelView: UITableView!
    
    let cityArr = CityInfo().city
    lazy var filterdArr = cityArr
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTabelView.dataSource = self
        cityTabelView.delegate = self
        
        let cityXib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTabelView.register(cityXib, forCellReuseIdentifier: "CityTableViewCell")
        cityTabelView.rowHeight = 160
        //filterdArr = travelArr
        
        setupView()
        // Do any additional setup after loading the view.
    }
    func setupView() {
        citySegment.setTitle("모두", forSegmentAt: 0)
        citySegment.setTitle("국내", forSegmentAt: 1)
        citySegment.setTitle("국외", forSegmentAt: 2)
    }
    
    
    @IBAction func citySegmentButtonTapped(_ sender: UISegmentedControl) {
        //true면 한국
        switch sender.selectedSegmentIndex {
        case 0:
            filterdArr = cityArr
        case 1:
            filterdArr = cityArr.filter{$0.domestic_travel}
        case 2:
            filterdArr = cityArr.filter{!$0.domestic_travel}
        default:
            print("오류")
        }
        cityTabelView.reloadData()
    }
    
}


extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filterdArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        //cell.setData(data: data)
        cell.setupCellData(data: data)
        return cell

    }
}
extension CityViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let data = filterdArr[indexPath.row]
//        if data.ad {
//            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTravelViewController") as! DetailTravelViewController
//            vc.model = data
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//            
//            
//        }else{
//            //관광지: Push
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "DetailTravelViewController") as! DetailTravelViewController
//            vc.model = data
//            navigationController?.pushViewController(vc, animated: true)
//            
//        }
//        
//    }
}
