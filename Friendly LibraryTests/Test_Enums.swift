//
//  Test_Enums.swift
//  Friendly LibraryTests
//
//  Created by SJ Porter on 2/17/21.
//

@testable import Friendly_Library
import XCTest

class Test_Enums: XCTestCase {

    func testHttpMethodGET() throws {
        let result = HttpMethod.GET.rawValue
        let expected = "GET"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpMethodPOST() throws {
        let result = HttpMethod.POST.rawValue
        let expected = "POST"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpMethodPUT() throws {
        let result = HttpMethod.PUT.rawValue
        let expected = "PUT"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpMethodDELETE() throws {
        let result = HttpMethod.DELETE.rawValue
        let expected = "DELETE"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpAuthMethodNONE() throws {
        let result = HttpAuthMethod.NONE.rawValue
        let expected = "NONE"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpAuthMethodBASIC() throws {
        let result = HttpAuthMethod.BASIC.rawValue
        let expected = "BASIC"
        XCTAssertEqual(result, expected)
    }
    
    func testHttpAuthMethodJWT() throws {
        let result = HttpAuthMethod.JWT_TOKEN.rawValue
        let expected = "JWT_TOKEN"
        XCTAssertEqual(result, expected)
    }

}
