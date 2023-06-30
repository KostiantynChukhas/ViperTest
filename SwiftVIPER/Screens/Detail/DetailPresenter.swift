//
//  DetailPresenter.swift
//  SwiftVIPER


import Foundation

typealias DetailPresenterDependencies = (
    interactor: DetailInteractor,
    router: DetailRouterOutput
)

final class DetailPresenter: Presenterable {

    internal var entities: DetailEntities
    private weak var view: DetailViewInputs!
    let dependencies: DetailPresenterDependencies

    init(entities: DetailEntities,
         view: DetailViewInputs,
         dependencies: DetailPresenterDependencies)
    {
        self.view = view
        self.entities = entities
        self.dependencies = dependencies
    }
}

extension DetailPresenter: DetailViewOutputs {
    func viewDidLoad() {
        view.configure(entities: entities)
        dependencies.interactor.fetchProgramItems()
    }
}

extension DetailPresenter: DetailInteractorOutputs {
    func onSuccessProgramItems(res: [ProgramItemsResponseModelElement]) {
        let filterArray = res.filter { $0.recentAirTime.channelID == entities.entryEntity.channelDetailModel.id }
        entities.programItemsList = filterArray
        view.reloadTableView(tableViewDataSource: DetailTableViewDataSource(entities: entities, presenter: self))
    }
    
    func onErrorSearch(error: Error) {
    }
}

extension DetailPresenter: DetailTableViewDataSourceOutputs {
}

