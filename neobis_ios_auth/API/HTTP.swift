//
//  HTTP.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

enum HTTP {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        enum Key: String {
            case contentType = "Content-Type"
            case accept = "Accept"
            case csrfToken = "X-CSRFtoken"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
        }
    }
}
