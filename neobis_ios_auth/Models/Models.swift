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

struct PasswordChange{
    let new_password1: String
    let new_password2: String
}

struct PasswordReset{
    let email: String
}

struct PasswordResetConfirm{
    let new_password1: String
    let new_password2: String
    let uid: String
    let token: String
}

struct Register: Codable{
    let username: String
    let email: String
    let password1: String
    let password2: String
}

struct ResendEmailVerification{
    let email: String
}

struct Token: Codable{
    let key: String
}

struct VerifyEmail{
    let key: String
}
