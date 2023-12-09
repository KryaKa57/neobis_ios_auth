//
//  Endpoint.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

enum Endpoint {
    
    case postLogin(url: String = "/api/v1/dj-rest-auth/login/")
    case postRegistration(url: String = "/api/v1/dj-rest-auth/registration/")
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.addValues(for: self)
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "68.183.72.178"
        components.port = nil
        components.path = self.path
        return components.url
    }
    
    private var path: String {
        switch self {
        case .postRegistration(let url), .postLogin(let url):
            return url
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .postRegistration, .postLogin:
            return HTTP.Method.post.rawValue
        }
    }
}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .postRegistration, .postLogin:
            var cookies =  URLSession.shared.configuration.httpCookieStorage?.cookies ?? [HTTPCookie()]
            
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.accept.rawValue)
            self.setValue(cookies.first?.value, forHTTPHeaderField: HTTP.Headers.Key.csrfToken.rawValue)
        }
    }
    
    mutating func addBody(for endpoint: Endpoint, with data: Data?) {
        switch endpoint {
        case .postRegistration, .postLogin:
            self.httpBody = data
        }
    }
}

