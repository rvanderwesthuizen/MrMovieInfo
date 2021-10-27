//
//  MovieDetailsRepositoryTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import XCTest

class MovieDetailsRepositoryTests: XCTestCase {
    var implementationUnderTests: MockedMovieDetailsRepository!
    override func setUp() {
        implementationUnderTests = MockedMovieDetailsRepository()
    }
    
    func testRepositorySuccess() {
        implementationUnderTests.shouldFail = false
        implementationUnderTests.performRequestWith(imdbID: "1234") { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(_):
                XCTFail("Repository should not fail")
            }
        }
    }
    
    func testRepositoryFailure() {
        implementationUnderTests.shouldFail = true
        implementationUnderTests.performRequestWith(imdbID: "") { result in
            switch result {
            case(.success(_)):
                XCTFail("Repository should not be successful")
            case (.failure(let error)):
                XCTAssertEqual("The operation couldn’t be completed. (Mr_Movie_InfoTests.customError error 0.)", error.localizedDescription)
            }
        }
    }
}
