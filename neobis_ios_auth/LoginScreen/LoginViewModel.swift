//
//  LoginViewModel.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

class LoginViewModel {
    
    var onUserLogined: (() -> Void)?
    var onErrorMessage: ((LoginServiceError) -> Void)?
    
    func postData(_ data: Login) {
        let endpoint = Endpoint.postLogin()

        LoginService.postData(loginData: data, with: endpoint) { [weak self] result in
            switch result {
            case .success:
                self?.onUserLogined?()
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}


