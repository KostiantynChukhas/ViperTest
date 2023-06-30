//
//  DetailTableViewDataSource.swift
//  SwiftVIPER


import Foundation
import UIKit

protocol DetailTableViewDataSourceOutputs: AnyObject {
}

final class DetailTableViewDataSource: TableViewItemDataSource {
    
    private var entities: DetailEntities!
    private weak var presenter: DetailTableViewDataSourceOutputs?

    init(entities: DetailEntities, presenter: DetailTableViewDataSourceOutputs) {
        self.entities = entities
        self.presenter = presenter
    }

    var numberOfItems: Int {
        return entities.programItemsList.count
    }

    func itemCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let repo = entities.programItemsList[safe: indexPath.row] else { return UITableViewCell() }
        guard let cell: ProgramItemsTableViewCell = tableView.dequeCell(for: indexPath) else { return UITableViewCell() }
        cell.setup(with: repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DetailTVHeader()
        view.setupCell(tvChannel: entities.entryEntity.channelDetailModel.callSign)
        return view
    }
    
    func didSelect(tableView: UITableView, indexPath: IndexPath) {
        
    }

}
