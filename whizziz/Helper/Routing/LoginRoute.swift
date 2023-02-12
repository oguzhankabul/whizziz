//
//  LoginRoute.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

protocol LoginRoute {
    func pushLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func pushLogin() {
        //TODO: set LoginRoute
    }
}

