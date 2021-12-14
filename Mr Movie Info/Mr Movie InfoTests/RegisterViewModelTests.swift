//
//  RegisterViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import XCTest
@testable import Mr_Movie_Info

class RegisterViewModelTests: XCTestCase {
    var implementationUnderTest: RegisterViewModel!
    var mockDelegate: MockDelegate!
    var mockRepositroy: MockFirebaseAuthRepository!
    override func setUp() {
        mockDelegate = MockDelegate()
        mockRepositroy = MockFirebaseAuthRepository()
        implementationUnderTest = RegisterViewModel(repository: mockRepositroy, delegate: mockDelegate)
    }
    
    class MockDelegate: ViewModelDelegate {
        var refreshCalled = false
        var didFailWithErrorCalled = false
        func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
            refreshCalled = true
        }
        
        func didFailWithError(error: Error) {
            didFailWithErrorCalled = true
        }
    }

    func testRegisterNewUser() {
        implementationUnderTest.registerNewUser(withEmail: "Email", password: "Password")
        XCTAssertEqual(mockRepositroy.user["Email"]!, "Email")
        XCTAssertEqual(mockRepositroy.user["Password"]!, "Password")
        XCTAssertTrue(mockDelegate.refreshCalled)
    }
    
    func testRegisterNewUserShouldFail() {
        mockRepositroy.shouldFail = true
        implementationUnderTest.registerNewUser(withEmail: "", password: "")
        XCTAssertTrue(mockRepositroy.user.isEmpty)
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    }
}
