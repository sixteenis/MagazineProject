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
    //var foodDatafilter: [Restaurant] = []
    let alert = UIAlertController(
        title: "메뉴 선택",
        message: "원하는 메뉴를 선택해주세요.",
        preferredStyle: .actionSheet
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        mapKit.delegate = self
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
        let ko = UIAlertAction(title: "한식", style: .default,handler: { title in
            let filterArr = self.foodArr.filter{ $0.category == title.title}
            self.changeAnnotation(data: filterArr)
            
        })
        let jp = UIAlertAction(title: "일식", style: .default, handler: { title in
            let filterArr = self.foodArr.filter{ $0.category == title.title}
            self.changeAnnotation(data: filterArr)
            
        })
        let usa = UIAlertAction(title: "양식", style: .default, handler: { title in
            let filterArr = self.foodArr.filter{ $0.category == title.title}
            self.changeAnnotation(data: filterArr)
            
        })
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
    func changeAnnotation(data:[Restaurant]) {
        mapKit.removeAnnotations(mapKit.annotations)
        addAnnotation(data: data)
    }
    
    @objc func fliterButtonTapped() {
        
        present(self.alert, animated: true)
    }
    

}


extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect annotation: any MKAnnotation) {
        print(#function)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
}
//extension MapViewController: UIActionSheetDelegate{
//    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
//        print(#function)
//        print(buttonIndex)
//    }
//}
//extension MapViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("리턴키 클릭")
//        return true
//    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("커서가 깜빡임")
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("커서 끝남")
//    }
//}
//extension MapViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return list.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//    
//        return list[row]
//        
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        mapTextField.text = list[row]
//        print(#function)
//        print(component, row)
//    }
//    
//}