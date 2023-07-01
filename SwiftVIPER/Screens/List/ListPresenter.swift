//
//  ListPresenter.swift
//  SwiftVIPER


import Foundation

typealias ListPresenterDependencies = (
    interactor: ListInteractor,
    router: ListRouterOutput
)

final class ListPresenter: Presenterable {
    internal var entities: ListEntities
    private weak var view: ListViewInputs!
    let dependencies: ListPresenterDependencies

    init(entities: ListEntities,
         view: ListViewInputs,
         dependencies: ListPresenterDependencies)
    {
        self.view = view
        self.entities = entities
        self.dependencies = dependencies
    }
}

extension ListPresenter: ListViewOutputs {
    
    
    func viewDidLoad() {
        view.configure(entities: entities)
        dependencies.interactor.fetchChannels()
        dependencies.interactor.fetchProgramItems()
        dependencies.router.dismiss(animated: true)
    }

    func onCloseButtonTapped() {
        dependencies.router.dismiss(animated: true)
    }
}

extension ListPresenter: ListInteractorOutputs {
    func onErrorChannels(error: Error) {
        view.indicatorView(animate: false)
    }
    
    func onSuccessProgramItems(res: [ProgramItemsResponseModelElement]) {
        entities.programItemsList = res
        view.reloadCollectionView(collectionViewDataSource: ListCollectionViewDataSource(entities: entities, presenter: self))
        view.indicatorView(animate: false)
    }
    
    func onErrorProgramItems(error: Error) {
        view.indicatorView(animate: false)
    }
    
    func onSuccessChannels(res: ChannelsResponseModel) {
        entities.channelsList = res
        view.reloadCollectionView(collectionViewDataSource: ListCollectionViewDataSource(entities: entities, presenter: self))
        view.indicatorView(animate: false)
    }

    func onErrorSearch(error: Error) {
        view.indicatorView(animate: false)
    }
}

extension ListPresenter: ListTableViewDataSourceOutputs {
    func didSelect(_ model: ChannelsResponseModelElement) {
        
    }
    
  
}
