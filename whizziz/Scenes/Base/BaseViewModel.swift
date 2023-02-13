//
//  BaseViewModel.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import UIKit

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() {}
    
    func showLoading(isUserInteractionEnabled: Bool = false) {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
    func handleError(_ error: Error, isShowToast: Bool = true, code: Int? = nil) {
        
        
    }
     
}

