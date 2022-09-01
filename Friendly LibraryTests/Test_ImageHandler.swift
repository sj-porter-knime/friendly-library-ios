//
//  Test_ImageHandler.swift
//  Friendly LibraryTests
//
//  Created by SJ Porter on 2/10/21.
//

@testable import Friendly_Library
import XCTest

class Test_ImageHandler: XCTestCase {

    func testImageHandlerMasterImageIsNotNil() throws {
        let handler = try? ImageHandler(master_image: UIImage.init())
        XCTAssertTrue(handler?.master_image != nil)
    }

}
