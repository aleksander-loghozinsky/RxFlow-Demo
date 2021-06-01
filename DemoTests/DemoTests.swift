//
//  DemoTests.swift
//  DemoTests
//
//  Created by Aleksander Loghozinsky on 28.05.2021.
//

import XCTest
@testable import Demo

class DemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testIsNameEqualTo() throws {
        let viewController = HomeViewController()
        XCTAssertNotNil(viewController.nibName)
        XCTAssertEqual(viewController.nibName, HomeViewController.identifier, "HomeViewController")
        XCTAssertNotEqual(viewController.description, HomeViewController.identifier)
        XCTAssertNotEqual(viewController.debugDescription, HomeViewController.identifier)
    }

}
