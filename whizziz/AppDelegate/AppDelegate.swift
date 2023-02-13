//
//  AppDelegate.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let visitorRouter = VisitorRouter()
        let visitorViewModel = VisitorViewModel(router: visitorRouter)
        let visitorViewController = VisitorViewController(viewModel: visitorViewModel)
        let nav = UINavigationController(rootViewController: visitorViewController)
        visitorRouter.viewController = visitorViewController
        window?.rootViewController = nav
        return true
    }
}
