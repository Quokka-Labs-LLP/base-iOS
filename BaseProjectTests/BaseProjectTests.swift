//
//  BaseProjectTests.swift
//  BaseProjectTests
//
//  Created by Jyoti Mishra on 14/07/23.
//

import XCTest
@testable import BaseProject
final class BaseProjectTests: XCTestCase {

    let userViewModel = UserListViewModel()
    var first = 10
    var second = 10
    var sum = 20
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_return_inValidEmail() throws {
        let email = "gfvgjhgmail.com"
        XCTAssertFalse(email.isValidEmail)

    }
    func test_return_inValidPhoneNumber() throws {
        let phone = "87767"
        XCTAssertTrue(phone.isValidPhoneNumber)

    }
    func test_return_validEmail() throws {
        let email = "gfvgjh@gmail.com"
        XCTAssert(email.isValidEmail)
    }
    func test_return_validPhoneNuber() throws {
        let phone = "879876334"
        XCTAssert(phone.isValidPhoneNumber)

    }
    func test_return_ValidResponse() {
        userViewModel.getUserList()
        XCTAssert(userViewModel.errorMeassage == nil)
        XCTAssert(userViewModel.userData == nil)
        XCTAssertFalse(userViewModel.userData != nil)
    }
    func testExample() throws {
        XCTAssert(sum == 20)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
