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
    
    var channels: [Channel]? {
        return entities.getChannels()
    }
    
    var numberOfSections: Int {
        return entities.getChannels()?.count ?? 0
    }
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, with section: Int) -> Int {
        return entities.getChannels()?[section].programs?.count ?? 0
    }
    
    func itemCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 { // Channels
            guard let channelCell: ChannelCollectionViewCell = collectionView.dequeCell(for: indexPath), let channel = entities.getChannels()?[indexPath.section] else { return UICollectionViewCell() }
                channelCell.configureWith(channel: channel)
                channelCell.configureWith(channel: channel)
                return channelCell
                
            } else {
                guard let programCell: ProgramCollectionViewCell = collectionView.dequeCell(for: indexPath), let channel = entities.getChannels()?[indexPath.section], let program = channel.programs?[indexPath.row ] else { return UICollectionViewCell() }
                programCell.configureWith(program: program)
                return programCell
            }
    }

}
