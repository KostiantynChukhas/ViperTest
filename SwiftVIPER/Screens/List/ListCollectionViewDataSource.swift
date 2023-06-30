//
//  ListTableViewDataSource.swift
//  SwiftVIPER


import Foundation
import UIKit

protocol ListTableViewDataSourceOutputs: AnyObject {
    func didSelect(_ model: ChannelsResponseModelElement)
}

final class ListCollectionViewDataSource: CollectionViewDataSource {
    
    private weak var entities: ListEntities!
    private weak var presenter: ListTableViewDataSourceOutputs?

    init(entities: ListEntities, presenter: ListTableViewDataSourceOutputs) {
        self.entities = entities
        self.presenter = presenter
    }

    var numberOfItems: Int {
        return entities.channelsList.count
    }
    
    func itemCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ListCollectionViewCell = collectionView.dequeCell(for: indexPath),
                let repo = entities.channelsList[safe: indexPath.row]
        else { return UICollectionViewCell() }
        cell.configure(with: repo)
        return cell
    }
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let selectedRepo = entities.channelsList[safe: indexPath.row] else { return }
        presenter?.didSelect(selectedRepo)
    }
}
