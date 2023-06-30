//
//  UITableView+NibLoadable.swift
//  SwiftVIPER


import Foundation
import UIKit

protocol NibLoadableView {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView {}

extension UITableViewCell {
    static var reuseIdentifier: String { return String(describing: self) }
}

extension UITableView {
    func registerNib<T: UITableViewCell>(cellType _: T.Type) {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeCell<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName, for: indexPath) as? T else {
            return nil
        }

        return cell
    }
}
