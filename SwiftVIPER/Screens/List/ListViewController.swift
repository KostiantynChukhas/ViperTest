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
}

final class ListViewController: UIViewController {
    
    var presenter: ListViewOutputs?
    var collectionViewDataSource: CollectionViewDataSource?
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.registerNib(ListCollectionViewCell.self)
            collectionView.registerNib(ChannelCollectionViewCell.self)
            collectionView.registerNib(ProgramCollectionViewCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

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
            let layout = ChannelCollectionViewLayout()
            layout.channels = collectionViewDataSource.channels
            self?.collectionView.setCollectionViewLayout(layout, animated: false)
            self?.collectionView.reloadData()
        }
    }
    
    func indicatorView(animate: Bool) {
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewDataSource?.numberOfSections ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDataSource?.numberOfItemsInSection(collectionView, with: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionViewDataSource?.itemCell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}

extension ListViewController: Viewable {}
