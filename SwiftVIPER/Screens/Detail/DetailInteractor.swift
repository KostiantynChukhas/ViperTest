//
//  DetailInteractor.swift
//  SwiftVIPER

import Foundation

protocol DetailInteractorOutputs: AnyObject {
    func onSuccessProgramItems(res: [ProgramItemsResponseModelElement])
    func onErrorSearch(error: Error)
}

final class DetailInteractor: Interactorable {
    
    weak var presenter: DetailInteractorOutputs?
    
    func fetchProgramItems() {
        let request = Networking.GetProgramItemsRequest()
        Networking().programItems(with: request, onSuccess: { [weak self] response in
            self?.presenter?.onSuccessProgramItems(res: response)
        }, onError: { [weak self] error in
            self?.presenter?.onErrorSearch(error: error)
        })
    }
}
