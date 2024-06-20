//
//  MapViewController.swift
//  MagazineProject
//
//  Created by 박성민 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation // 위치 프레임 워크


class MapViewController: UIViewController {
    
    
    @IBOutlet var mapKit: MKMapView!
    let foodArr = RestaurantList().restaurantArray
    let alert = UIAlertController(
        title: "메뉴 선택",
        message: nil,
        preferredStyle: .actionSheet
    )
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAlert()
        //setupAnnotation()
        checkDeviceLoactionAutorization()
        addAnnotation(data: foodArr)
        locationManager.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
extension MapViewController {
    //1) 사용자에게 권한을 요청을 하기 위해, iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLoactionAutorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                // 현재 사용자 위치 권한 상태 확인
                let authorization: CLAuthorizationStatus
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                }else{
                    authorization = CLLocationManager.authorizationStatus()
                }
                DispatchQueue.main.async {
                    self.checkCurrentLoactionAuthoriztion(status: authorization)
                }
            } else {
                print("위치 서비스 꺼저있음")
            }
        }
        
        
    }
    func checkCurrentLoactionAuthoriztion(status: CLAuthorizationStatus) {
            switch status {
            case .notDetermined:
                print("이 권한에서만 권한 문구를 띄울 수 있음")
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
                
            case .denied:
                showLocationSettingAlert()
          
            case .authorizedWhenInUse:
                print("위치 정보 알려달라고 로직을 구성할 수 있음")
                locationManager.startUpdatingLocation()
         
            default:
                print(status)
            }
            
        }
        //3) 설정으로 이동 Alert
        func showLocationSettingAlert() {
            let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
            let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
                if let setting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(setting)
                }
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(goSetting)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        func setRegionAndAnntation(center: CLLocationCoordinate2D) {
            let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
            mapKit.setRegion(region, animated: true)
        }
}

extension MapViewController: CLLocationManagerDelegate{
    //5. 사용자 위치를 성공적으로 가지고 온 경우
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let coordinate = locations.last?.coordinate {
                print(coordinate)
                setRegionAndAnntation(center: coordinate)
            }
            print(#function)
            print(locations)
            //startUpdatingLocation을 실행하면 실행됨
            
            locationManager.stopUpdatingLocation()//위치 받는거 멈추기
        }
        //6. 사용자 위치를 가지고 오지 못했거나
        func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
            print(#function)
        }
        //7. 사용자가 허용했었는데 아이폰 설정에서 나중에 허용을 거부한다면..?
        //사용자 권한 상태가 변경이 될때, 인스턴스가 생성될때 자동으로 실행된다.
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            print(#function)
            
            checkDeviceLoactionAutorization()
        }
        //14-
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            print(#function)
        }
}
