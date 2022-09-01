//
//  Test_HttpAuth.swift
//  Friendly LibraryTests
//
//  Created by SJ Porter on 2/17/21.
//

@testable import Friendly_Library
import XCTest

class Test_HttpAuth: XCTestCase {

    func testInvalidJWT() throws {
        XCTAssertThrowsError(
            try HttpAuth(
                auth_method: HttpAuthMethod.JWT_TOKEN,
                username: "test",
                password: "test"
            )
        )
    }
    
    func testInvalidBasic() throws {
        XCTAssertThrowsError(
            try HttpAuth(
                auth_method: HttpAuthMethod.BASIC,
                jwt_token: "something"
            )
        )
    }
    
    func testMissingUsername() throws {
        XCTAssertThrowsError(
            try HttpAuth(
                auth_method: HttpAuthMethod.BASIC,
                password: "test"
            )
        )
    }
    
    func testMissingPassword() throws {
        XCTAssertThrowsError(
            try HttpAuth(
                auth_method: HttpAuthMethod.BASIC,
                password: "test"
            )
        )
    }
    
    func testExtraCredentials() throws {
        XCTAssertNoThrow(
            try HttpAuth(
                auth_method: HttpAuthMethod.BASIC,
                username: "test",
                password: "test",
                jwt_token: "something"
            )
        )
    }

}
