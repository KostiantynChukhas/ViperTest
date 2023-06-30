//
//  ListRouter.swift
//  SwiftVIPER


import Foundation
import UIKit

struct ListRouterInput {

    private func view() -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let dependencies = ListPresenterDependencies(interactor: interactor, router: ListRouterOutput(view))
        let presenter = ListPresenter(entities: ListEntities(), view: view, dependencies: dependencies)
        view.presenter = presenter
        view.collectionViewDataSource = ListCollectionViewDataSource(entities: presenter.entities, presenter: presenter)
        interactor.presenter = presenter
        return view
    }

    func push(from: Viewable) {
        let view = self.view()
        from.push(view, animated: true)
    }

    func present(from: Viewable) {
        let nav = UINavigationController(rootViewController: view())
        from.present(nav, animated: true)
    }
}

final class ListRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }

    func transitionDetail(channelDetailModel: ChannelsResponseModelElement) {
        DetailRouterInput().push(from: view, entryEntity: DetailEntryEntity(channelDetailModel: channelDetailModel))
    }
}


