//
//  VisitorViewModel.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

protocol VisitorViewModelDataSource {}

protocol VisitorViewModelEventSource {
    func pushLogin()
    func pushTrhWhizziz()
    func pushLoginWithGoogle()
}

protocol VisitorViewModelProtocol: VisitorViewModelDataSource, VisitorViewModelEventSource {}

final class VisitorViewModel: BaseViewModel<VisitorRouter>, VisitorViewModelProtocol {
    
    override init(router: VisitorRouter) {
        super.init(router: router)
    }
}

// MARK: - Navigate
extension VisitorViewModel {
    
    func pushLogin() {
        router.pushLogin()
    }
    
    func pushTrhWhizziz() {
        router.pushTryWhizziz()
    }
    
    func pushLoginWithGoogle() {
        router.pushLoginWithGoogleRoute()
    }
}

