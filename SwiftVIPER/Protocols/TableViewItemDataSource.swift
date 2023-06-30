//
//  TableViewItemDataSource.swift
//  SwiftVIPER


import Foundation
import UIKit

@objc protocol TableViewItemDataSource: AnyObject {
    var numberOfItems: Int { get }

    func itemCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    @objc optional func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
}

