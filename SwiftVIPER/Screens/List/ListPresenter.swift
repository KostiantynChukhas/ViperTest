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
        entities.channelApiState.isFetching = true
        dependencies.interactor.fetchChannels()
    }

    func onCloseButtonTapped() {
        dependencies.router.dismiss(animated: true)
    }

    func onReachBottom() {
        guard !entities.channelApiState.isFetching else { return }
        entities.channelApiState.isFetching = true
        dependencies.interactor.fetchChannels()
        view.indicatorView(animate: true)
    }
}

extension ListPresenter: ListInteractorOutputs {
    func onSuccessChannels(res: ChannelsResponseModel) {
        entities.channelApiState.isFetching = false
        entities.channelsList = res
        view.reloadCollectionView(collectionViewDataSource: ListCollectionViewDataSource(entities: entities, presenter: self))
        view.indicatorView(animate: false)
    }

    func onErrorSearch(error: Error) {
        view.indicatorView(animate: false)
    }
}

extension ListPresenter: ListTableViewDataSourceOutputs {
    func didSelect(_ channelModel: ChannelsResponseModelElement) {
        dependencies.router.transitionDetail(channelDetailModel: channelModel)
    }
}
