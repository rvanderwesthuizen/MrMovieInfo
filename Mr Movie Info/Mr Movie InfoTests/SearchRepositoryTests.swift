//
//  SearchRepositoryTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import XCTest
@testable import Mr_Movie_Info

class SearchRepositoryTests: XCTestCase {
    var implementationUnderTests: MockedSearchRepository!
    override func setUp() {
        implementationUnderTests = MockedSearchRepository()
    }

    func testRepositorySuccess() {
        implementationUnderTests.shouldFail = false
        implementationUnderTests.performRequestWith(title: "", pageNumber: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual("20", response.totalResults)
            case .failure(_):
                XCTFail("Repository should not fail")
            }
        }
    }
    
    func testPageNumberIfTotalResultsMod10is0() {
        implementationUnderTests.performRequestWith(title: "", pageNumber: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.numberOfPages, 2)
            case .failure(_):
                XCTFail("Should not fail")
            }
        }
    }
    
    func testPageNumberIfTotalResultsMod10IsNot0() {
        implementationUnderTests.mod10Is0 = false
        implementationUnderTests.performRequestWith(title: "", pageNumber: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.numberOfPages, 3)
            case .failure(_):
                XCTFail("Should not fail")
            }
        }
    }
    
    func testRepositoryFailure() {
        implementationUnderTests.shouldFail = true
        implementationUnderTests.performRequestWith(title: "", pageNumber: 1) { result in
            switch result {
            case(.success(_)):
                XCTFail("Repository should not be successful")
            case (.failure(let error)):
                XCTAssertEqual("The operation couldn’t be completed. (Mr_Movie_InfoTests.customError error 0.)", error.localizedDescription)
            }
        }
    }
}
