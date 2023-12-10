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
        
    }
}
