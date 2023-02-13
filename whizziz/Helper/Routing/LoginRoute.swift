//
//  LoginRoute.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

protocol LoginRoute {
    func pushLogin(username: String?)
}

extension LoginRoute where Self: RouterProtocol {
    
    func pushLogin(username: String?) {
        let router = HomepageRouter()
        let viewModel = HomepageViewModel(router: router, username: username)
        let viewController = HomepageViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        setNavigationRoot(viewController, transition: transition)
        //open(viewController, transition: transition)
    }
}
