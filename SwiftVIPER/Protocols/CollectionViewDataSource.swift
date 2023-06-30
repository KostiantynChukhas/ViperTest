//
//  CollectionViewDataSource.swift
//  SwiftVIPER


import UIKit

protocol CollectionViewDataSource: AnyObject {
    var numberOfItems: Int { get }
    func itemCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath)
}
