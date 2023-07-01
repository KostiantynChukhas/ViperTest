//
//  CollectionViewDataSource.swift
//  SwiftVIPER


import UIKit

protocol CollectionViewDataSource: AnyObject {
    var numberOfSections: Int { get }
    var channels: [Channel]? { get }
    func numberOfItemsInSection(_ collectionView: UICollectionView, with section: Int) -> Int
    func itemCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
