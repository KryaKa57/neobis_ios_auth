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
    
    private(set) var isUserLogined: Bool = false {
        didSet {
            self.onUserLogined?()
        }
    }
    
    init() {
        //self.postData()
    }
    
}


