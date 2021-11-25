//
//  YoutubeRepositoryTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/25.
//

import XCTest

class YoutubeRepositoryTests: XCTestCase {
    var implementationUnderTest: MockYoutubeRepository!
    
    override func setUp() {
        implementationUnderTest = MockYoutubeRepository()
    }
    
    func testRepositoryShouldFail() {
        implementationUnderTest.shouldFail = true
        implementationUnderTest.fetchVideoIDUsing(title: "Movie+Title") { result in
            switch result {
            case .success(_):
                XCTFail("For this test the repository should fail")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (Mr_Movie_InfoTests.customError error 0.)")
            }
        }
    }
    
    func testRepositoryShouldSucceed() {
        implementationUnderTest.shouldFail = false
        implementationUnderTest.fetchVideoIDUsing(title: "Movie+Title") { result in
            switch result {
            case .success(let id):
                XCTAssertEqual("1234", id)
            case .failure(_):
                XCTFail()
            }
        }
    }
}
