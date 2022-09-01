//
//  Test_HttpClient.swift
//  Friendly LibraryTests
//
//  Created by SJ Porter on 2/17/21.
//

@testable import Friendly_Library
import XCTest

class Test_HttpClient: XCTestCase {
    
    func testNoAuthGet() throws {
        let auth = try HttpAuth(auth_method: HttpAuthMethod.NONE)
        let http_client = HttpNoAuthClient(http_auth: auth)
        let request = http_client.build_request(
            url: "https://www.google.com/",
            http_method: HttpMethod.GET
        )
        http_client.submit_request(request: request)
        sleep(3)
        XCTAssertTrue(http_client.results != nil)
    }
    
    func testBasicAuthGet() throws {
        let auth = try HttpAuth(
            auth_method: HttpAuthMethod.BASIC,
            username: "service_account_friendly_library",
            password: "knimedemo"
        )
        let http_client = HttpBasicAuthClient(http_auth: auth)
        let request = http_client.build_request(
            url: "https://datascience2.knime.com/knime/rest/v4/repository/Projects/Friendly%20Library/friendly_library_rest_api:execution",
            http_method: HttpMethod.GET
        )
        http_client.submit_request(request: request)
        sleep(3)
        XCTAssertTrue(http_client.results != nil)
    }
}
