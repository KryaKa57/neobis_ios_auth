//
//  RegisterViewModel.swift
//  neobis_ios_auth
//
//  Created by Alisher on 07.12.2023.
//

import Foundation

class RegisterViewModel {
    
    var userRegistered: (() -> Void)?
    var registerErrorMessage : ((RegisterServiceError) -> Void)?
    
    init() {
        //self.postData()
    }
    
    public func postData(data registerData: Register) {
        let endpoint = Endpoint.postRegistration()

        RegisterService.postData(registerData: registerData, with: endpoint) { [weak self] result in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
