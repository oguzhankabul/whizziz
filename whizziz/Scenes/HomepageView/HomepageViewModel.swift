//
//  VisitorViewModel.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

protocol HomepageViewModelDataSource {
    var userName: String { get }
}

protocol HomepageViewModelEventSource {}

protocol HomepageViewModelProtocol: HomepageViewModelDataSource, HomepageViewModelEventSource {}

final class HomepageViewModel: BaseViewModel<HomepageRouter>, HomepageViewModelProtocol {
    
    var userName: String
    
    init(router: HomepageRouter, username: String?) {
        self.userName = username ?? "-"
        super.init(router: router)
    }
}
