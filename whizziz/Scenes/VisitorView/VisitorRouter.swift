//
//  VisitorRouter.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

final class VisitorRouter: Router, VisitorRouter.Routes {
    typealias Routes = TryWhizzizRoute & LoginRoute & LoginWithGoogleRoute
    
}
