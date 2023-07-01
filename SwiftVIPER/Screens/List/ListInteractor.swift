//
//  ListInteractor.swift
//  SwiftVIPER


import Foundation

protocol ListInteractorOutputs: AnyObject {
    func onSuccessChannels(res: ChannelsResponseModel)
    func onErrorChannels(error: Error)
    
    func onSuccessProgramItems(res: [ProgramItemsResponseModelElement])
    func onErrorProgramItems(error: Error)
}

final class ListInteractor: Interactorable {

    weak var presenter: ListInteractorOutputs?

    func fetchChannels() {
        let request = Networking.GetChannelRequest()
        Networking().channels(with: request, onSuccess: { [weak self] res in
            self?.presenter?.onSuccessChannels(res: res)
            //print(res)
        }, onError: { [weak self] error in
                self?.presenter?.onErrorChannels(error: error)
        })
    }
    
    func fetchProgramItems() {
        let request = Networking.GetProgramItemsRequest()
        Networking().programItems(with: request, onSuccess: { [weak self] response in
            self?.presenter?.onSuccessProgramItems(res: response)
        }, onError: { [weak self] error in
            self?.presenter?.onErrorProgramItems(error: error)
        })
    }
}
