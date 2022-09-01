//
//  HttpClient.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/17/21.
//

import Foundation


class BaseHttpClient {
    
    var results: Data?
    var http_auth: HttpAuth
    
    init(http_auth: HttpAuth) {
        self.http_auth = http_auth
    }
    
    func build_request(
        url: String,
        http_method: HttpMethod,
        message_body: Codable? = nil
    ) -> URLRequest {
        return URLRequest(url:URL(string:url)!)
    }
    
    func submit_request(request: URLRequest!) {
        let task = URLSession.shared.dataTask(with: request) { (
            data,
            response,
            error
        ) in
            if let data = data {
                self.results = data
            }
        }
        task.resume()
    }
}

class HttpNoAuthClient: BaseHttpClient {
    override func build_request(
        url: String,
        http_method: HttpMethod,
        message_body: Codable? = nil
    ) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = http_method.rawValue
        return request
    }
}

class HttpBasicAuthClient: BaseHttpClient {
    override func build_request(
        url: String,
        http_method: HttpMethod,
        message_body: Codable? = nil
    ) -> URLRequest {
        let username_string = String(
            format: "%@:%@",
            self.http_auth.username!,
            self.http_auth.password!
        )
        let login_string = username_string
            .data(using: String.Encoding.utf8)!
            .base64EncodedString()
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = http_method.rawValue
        request.setValue(
            "Basic \(String(login_string))",
            forHTTPHeaderField: "Authorization"
        )
        
        if message_body != nil {
            request.addValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
        }
        
        return request
    }
}
