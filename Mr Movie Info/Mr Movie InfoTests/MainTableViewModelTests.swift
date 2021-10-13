//
//  MainTableViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import XCTest
@testable import Mr_Movie_Info

class MainTableViewModelTests: XCTestCase {
    var implementationUnderTest: MainTableViewModiable!
    override func setUp() {
        implementationUnderTest = MockedMainTableViewModel(repository: MockedSearchRepository())
    }
    
    func testRetrieveData() {
        implementationUnderTest.retrieveData(forTitle: "the flash")
        if let result = implementationUnderTest.fetchSearchResult(at: 0) {
            XCTAssertEqual(result.title, "the+flash")
        }
    }
    
    func textLoadNextPage() {
        implementationUnderTest.loadNextPage(forTitle: "")
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 1))
    }
    
    func testFailureWhenIndexDoesNotExist() {
        implementationUnderTest.retrieveData(forTitle: "")
        XCTAssertNil(implementationUnderTest.fetchSearchResult(at: -1))
    }
    
    func testSuccessWhenIndexDoesExist() {
        implementationUnderTest.retrieveData(forTitle: "")
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 0))
    }
}
