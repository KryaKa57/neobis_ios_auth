//
//  LoginViewModel.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

class LoginViewModel {
    
    var isUserLogined: Bool = false
    var loginErrorMessage: String = ""
    
    init() {
        //self.postData()
    }
    
    public func postData(data loginData: Login) {
        
        let endpoint = Endpoint.postLogin()

        LoginService.postData(loginData: loginData, with: endpoint) { [weak self] result in
            switch result {
            case .success(_):
                self?.isUserLogined = true
            case .failure(let error):
                self?.loginErrorMessage = error.localizedDescription
            }
        }
    }
}


