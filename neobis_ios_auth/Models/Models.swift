//
//  Login.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

struct Login: Codable {
    let username: String
    let email: String
    let password: String
}

struct Register: Codable{
    let username: String
    let email: String
    let password1: String
    let password2: String
}

struct Token: Codable{
    let key: String
}
