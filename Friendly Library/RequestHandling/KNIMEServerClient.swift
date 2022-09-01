//
//  KNIMEServerClient.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/10/21.
//

import Foundation


class KNIMEServerClient {
    
    var server_url: String!
    var http_auth: HttpAuth
    var http_client: BaseHttpClient
    
    init(
        server_url: String,
        username: String!,
        password: String!
    ) throws {
        self.server_url = server_url
        self.http_auth = try HttpAuth(
            auth_method: HttpAuthMethod.BASIC,
            username: username,
            password: password
        )
        self.http_client = HttpBasicAuthClient(http_auth: self.http_auth)
    }
    
    func post_to_workflow(workflow_uri: String, message_body: ImageRequest?) {
        let request = self.http_client.build_request(
            url: self.server_url + workflow_uri,
            http_method: HttpMethod.POST,
            message_body: message_body
        )
        
        self.http_client.submit_request(request: request)
    }
}
