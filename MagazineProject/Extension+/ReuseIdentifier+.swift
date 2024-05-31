//
//  ReuseIdentifier+.swift
//  MagazineProject
//
//  Created by 박성민 on 5/31/24.
//
import UIKit
protocol ReuseIdentifierProtocol {
    static var identifier: String { get }
}
extension ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifierProtocol{}
extension UITableView: ReuseIdentifierProtocol{}
extension UIViewController: ReuseIdentifierProtocol{}
//extension UIStoryboard:ReuseIdentifierProtocol{}
//extension NSObject:ReuseIdentifierProtocol {}
//위 코드를 통해 항상 Identifier를 설정해주어야 할 때마다 String으로 주어야되는 과정을 생략
//및 휴먼오류를 최소화할 수 있다!
