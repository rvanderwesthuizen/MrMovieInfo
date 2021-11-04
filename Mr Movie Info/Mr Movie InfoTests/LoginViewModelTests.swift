//
//  LoginViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/04.
//

import XCTest
@testable import Mr_Movie_Info

class LoginViewModelTests: XCTestCase {
    var mockRepository: MockFirebaseAuthRepository!
    var mockDelegate: MockDelegate!
    var implementationUnderTest: LoginViewModel!
    override func setUp() {
        mockRepository = MockFirebaseAuthRepository()
        mockDelegate = MockDelegate()
        implementationUnderTest = LoginViewModel(repository: mockRepository, delegate: mockDelegate)
    }

    class MockDelegate: ViewModelDelegate {
        var didFailWithErrorTriggered = false
        var refreshViewContentTriggered = false
        func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
            refreshViewContentTriggered = true
        }
        
        func didFailWithError(error: Error) {
            didFailWithErrorTriggered = true
        }
    }
    
    func testLoginUser() {
        mockRepository.registerNewUser(withEmail: "Email", password: "Password") { _ in }
        implementationUnderTest.loginUser(withEmail: "Email", password: "Password")
        XCTAssertTrue(mockDelegate.refreshViewContentTriggered)
    }
    
    func testLoginUserShouldFail() {
        mockRepository.shouldFail = true
        implementationUnderTest.loginUser(withEmail: "", password: "")
        XCTAssertTrue(mockDelegate.didFailWithErrorTriggered)
    }
}
