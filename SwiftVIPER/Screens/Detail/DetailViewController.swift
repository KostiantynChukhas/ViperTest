//
//  DetailViewController.swift
//  SwiftVIPER

import UIKit
import WebKit


protocol DetailViewInputs: AnyObject {
    func configure(entities: DetailEntities)
    func reloadTableView(tableViewDataSource: DetailTableViewDataSource)
}

protocol DetailViewOutputs: AnyObject {
    func viewDidLoad()
}


final class DetailViewController: UIViewController {

    internal var presenter: DetailViewOutputs?
    
    internal var tableViewDataSource: TableViewItemDataSource?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewInputs {
    func reloadTableView(tableViewDataSource: DetailTableViewDataSource) {
        self.tableViewDataSource = tableViewDataSource
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func configure(entities: DetailEntities) {
        navigationItem.title = entities.entryEntity.channelDetailModel.callSign
        
        tableView.registerNib(cellType: ProgramItemsTableViewCell.self)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewDataSource?.itemCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableViewDataSource?.tableView?(tableView, viewForHeaderInSection: section)
    }
}

extension DetailViewController: Viewable {}
