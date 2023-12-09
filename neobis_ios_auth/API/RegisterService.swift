//
//  LoginService.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation

enum RegisterServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unknown(String = "An unknown error occured.")
}

class RegisterService {
    static func postData(registerData: Register,
                         with endpoint: Endpoint,
                         completition: @escaping (Result<Token, RegisterServiceError>)->Void) {
        var request = endpoint.request!
        
        let requestData = try? JSONEncoder().encode(registerData)
        request.addBody(for: endpoint, with: requestData)
        
        URLSession.shared.dataTask(with: request) {data, resp, error in
            if let error = error {
                completition(.failure(.unknown(error.localizedDescription)))
                return
            }

            if let resp = resp as? HTTPURLResponse, resp.statusCode < 200 && resp.statusCode >= 300 {
                completition(.failure(.invalidResponse))
                return
            }
            
            do {
              // create json object from data or use JSONDecoder to convert to Model stuct
                if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                print(jsonResponse)
                // handle json response
              } else {
                print("data maybe corrupted or in wrong format")
                throw URLError(.badServerResponse)
              }
            } catch let error {
              print(error.localizedDescription)
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let tokenKey = try decoder.decode(Token.self, from: data)
                    completition(.success(tokenKey))
                } catch {
                    completition(.failure(.invalidData))
                    print(data)
                }
            } else {
                completition(.failure(.unknown()))
            }
        }.resume()
    }
}
