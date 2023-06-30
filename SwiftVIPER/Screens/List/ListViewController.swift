//
//  ListViewController.swift
//  SwiftVIPER


import UIKit

protocol ListViewInputs: AnyObject {
    func configure(entities: ListEntities)
    func reloadCollectionView(collectionViewDataSource: ListCollectionViewDataSource)
    func indicatorView(animate: Bool)
}

protocol ListViewOutputs: AnyObject {
    func viewDidLoad()
    func onCloseButtonTapped()
    func onReachBottom()
}

final class ListViewController: UIViewController {
    
    internal var presenter: ListViewOutputs?
    internal var collectionViewDataSource: CollectionViewDataSource?
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(ListCollectionViewCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension ListViewController: ListViewInputs {
    
    func configure(entities: ListEntities) {
        navigationItem.title = "TV Channels"
    }
    
    func reloadCollectionView(collectionViewDataSource: ListCollectionViewDataSource) {
        self.collectionViewDataSource = collectionViewDataSource
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func indicatorView(animate: Bool) {
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDataSource?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionViewDataSource?.itemCell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionViewDataSource?.didSelect(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout?.minimumInteritemSpacing = 4
        layout?.minimumLineSpacing = 4
        layout?.invalidateLayout()
        return CGSize(width: ((self.view.frame.width/2) - 6), height: ((self.view.frame.width / 2) - 6))
    }
}

extension ListViewController: Viewable {}
