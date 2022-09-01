//
//  HttpAuth.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/17/21.
//

import Foundation

class HttpAuth {
    var auth_method: HttpAuthMethod
    var username: String?
    var password: String?
    var jwt_token: String?
    
    init (
        auth_method: HttpAuthMethod,
        username: String? = nil,
        password: String? = nil,
        jwt_token: String? = nil
    ) throws {
        self.auth_method = auth_method
        self.username = username
        self.password = password
        self.jwt_token = jwt_token
        try self.verify_credentials()
    }
    
    func verify_credentials() throws {
        if self.auth_method == HttpAuthMethod.BASIC {
            if self.username == nil || self.password == nil {
                throw HttpClientError.invalidCredentials(
                    "Http credentials do not match " +
                        "specified auth method \(self.auth_method.rawValue)."
                )
            }
        }
        if self.auth_method == HttpAuthMethod.JWT_TOKEN {
            if self.jwt_token == nil {
                throw HttpClientError.invalidCredentials(
                    "Http credentials do not match " +
                        "specified auth method \(self.auth_method.rawValue)."
                )
            }
        }
    }
}


