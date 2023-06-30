//
//  ListInteractor.swift
//  SwiftVIPER


import Foundation

protocol ListInteractorOutputs: AnyObject {
    func onSuccessChannels(res: ChannelsResponseModel)
    func onErrorSearch(error: Error)
}

final class ListInteractor: Interactorable {

    weak var presenter: ListInteractorOutputs?

    func fetchChannels() {
        let request = Networking.GetChannelRequest()
        Networking().channels(with: request, onSuccess: { [weak self] res in
            self?.presenter?.onSuccessChannels(res: res)
            //print(res)
        }, onError: { [weak self] error in
                self?.presenter?.onErrorSearch(error: error)
        })
    }
}
