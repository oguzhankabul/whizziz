//
//  VisitorViewModel.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation
import PromiseKit
import Alamofire

protocol VisitorViewModelDataSource {}

protocol VisitorViewModelEventSource {
    func pushLogin()
    func pushTryWhizziz()
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
        showLoading()
        firstly { () -> Promise<User?> in
            return getUser()
        } .done { user in
            guard let user = user else { return }
            self.router.pushLogin(username: user.data.user.username)
        } .catch { error in
            print(error)
        } .finally {
            self.hideLoading()
        }
    }
    
    func pushTryWhizziz() {
        router.pushTryWhizziz()
    }
    
    func pushLoginWithGoogle() {
        router.pushLoginWithGoogleRoute()
    }
}

// MARK: - Request

extension VisitorViewModel {
    private func getUser() -> Promise<User?> {
        let (promise, resolver) = Promise<User?>.pending()
        let header = HTTPHeaders(["X-Organik-Auth" : "c57f5351569f71575292bbaa447c7dbe72b080fe"])
        AF.request("https://api.organikhaberlesme.com/me", headers: header).responseJSON{ response in
            if let error = response.error{
                resolver.reject(error)
            }
            
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                    resolver.fulfill(user)
                } catch {
                    resolver.reject(error)
                }
            }
        }
        return promise
    }
}

