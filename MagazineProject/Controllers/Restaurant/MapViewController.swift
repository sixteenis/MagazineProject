//
//  MapViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet var mapKit: MKMapView!
    let foodArr = RestaurantList().restaurantArray
    let alert = UIAlertController(
        title: "메뉴 선택",
        message: nil,
        preferredStyle: .actionSheet
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAlert()
        setupAnnotation()
    }
    func setupView() {
        let navitem = UIBarButtonItem(title: "Fliter", style: .plain, target: self, action: #selector(fliterButtonTapped))
        navigationItem.rightBarButtonItem = navitem
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    func setupAlert() {
        let ko = UIAlertAction(title: "한식", style: .default,handler: {self.alertbuttonTapped($0)})
        let jp = UIAlertAction(title: "일식", style: .default, handler: {self.alertbuttonTapped($0)})
        let usa = UIAlertAction(title: "양식", style: .default, handler: {self.alertbuttonTapped($0)})
        let all = UIAlertAction(title: "전체", style: .default, handler: { title in
            let filterArr = self.foodArr
            self.changeAnnotation(data: filterArr)
            
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3.
        alert.addAction(cancel)
        alert.addAction(all)
        alert.addAction(ko)
        alert.addAction(jp)
        alert.addAction(usa)
        
    }
    func setupAnnotation(){
        let loaction = CLLocationCoordinate2D(latitude: 37.517940, longitude: 126.886881)
        mapKit.region = MKCoordinateRegion(center: loaction, latitudinalMeters: 500, longitudinalMeters: 500)
        addAnnotation(data: foodArr)
        
    }
    func addAnnotation(data: [Restaurant]){
        for i in 0..<data.count {
            let annotation = MKPointAnnotation()
            annotation.coordinate = data[i].loaction
            annotation.title = data[i].name

            mapKit.addAnnotation(annotation)
        }
    }
    
    func alertbuttonTapped(_ title: UIAlertAction) {
        let filterArr = self.foodArr.filter{ $0.category == title.title}
        self.changeAnnotation(data: filterArr)
    }
    
    func changeAnnotation(data:[Restaurant]) {
        mapKit.removeAnnotations(mapKit.annotations)
        addAnnotation(data: data)
    }
    
    @objc func fliterButtonTapped() {
        
        present(self.alert, animated: true)
    }
    

}

