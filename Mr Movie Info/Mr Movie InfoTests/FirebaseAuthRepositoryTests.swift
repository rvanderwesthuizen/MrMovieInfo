//
//  FirebaseAuthRepositoryTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/04.
//

import XCTest
@testable import Mr_Movie_Info

class FirebaseAuthRepositoryTests: XCTestCase {
    var implementationUnderTest: MockFirebaseAuthRepository!
    override func setUp() {
        implementationUnderTest = MockFirebaseAuthRepository()
    }
    
    func testSignInUserShouldFail() {
        implementationUnderTest.shouldFail = true
        implementationUnderTest.signInUser(withEmail: "", password: "") { result in
            switch result {
            case .success(_):
                XCTFail("Repository should fail")
            case .failure(let error):
                XCTAssertEqual("The operation couldn’t be completed. (Mr_Movie_InfoTests.customError error 0.)", error.localizedDescription)
            }
        }
    }
    
    func testSignInUserSuccess() {
        implementationUnderTest.shouldFail = false
        implementationUnderTest.signInUser(withEmail: "", password: "") { result in
            switch result {
            case .success(let flag):
                XCTAssertTrue(flag)
            case .failure(_):
                XCTFail("The repository should succeed")
            }
        }
    }
    
    func testRegisterNewUserShouldFail() {
        implementationUnderTest.shouldFail = true
        implementationUnderTest.registerNewUser(withEmail: "", password: "") { result in
            switch result {
            case .success(_):
                XCTFail("Repository should fail")
            case .failure(let error):
                XCTAssertEqual("The operation couldn’t be completed. (Mr_Movie_InfoTests.customError error 0.)", error.localizedDescription)
            }
        }
    }
    
    func testRegisterNewUserSuccess() {
        implementationUnderTest.shouldFail = false
        implementationUnderTest.registerNewUser(withEmail: "", password: "") { result in
            switch result {
            case .success(let flag):
                XCTAssertTrue(flag)
            case.failure(_):
                XCTFail("The repository should succeed")
            }
        }
    }
}
