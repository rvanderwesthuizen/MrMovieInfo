//
//  MainTableViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import XCTest
@testable import Mr_Movie_Info

class MainTableViewModelTests: XCTestCase {
    private var implementationUnderTest: MainTableViewModel!
    private var mockRepository: MockedSearchRepository!
    private var mockDelegate: MockDelegate!
    
    override func setUp() {
        mockDelegate = MockDelegate()
        mockRepository = MockedSearchRepository()
        implementationUnderTest = MainTableViewModel(repository: mockRepository, delegate: mockDelegate)
    }
    
    func testRetrieveDataSuccess() {
        implementationUnderTest.retrieveData(forTitle: "the flash", page: 1)
        XCTAssertEqual(implementationUnderTest.fetchSearchResult(at: 0)!.title, "the flash")
        XCTAssertTrue(mockDelegate.refreshCalled)
    }
    
    func testRetrieveDataFailure() {
        mockRepository.shouldFail = true
        implementationUnderTest.retrieveData(forTitle: " ", page: 1)
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    }
    
    func testNumberOfRows() {
        implementationUnderTest.retrieveData(forTitle: "", page: 1)
        XCTAssertEqual(implementationUnderTest.numberOfRows, 1)
    }
    
    func testNumberOfRowsReturn0WhenListIsEmpty() {
        XCTAssertEqual(implementationUnderTest.numberOfRows,0)
    }
    
    func testSearchShouldSucceed() {
        implementationUnderTest.search(forTitle: "")
        XCTAssertTrue(mockDelegate.refreshCalled)
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 0))
    }
    
    func testSearchShouldFail() {
        mockRepository.shouldFail = true
        implementationUnderTest.search(forTitle: "")
        XCTAssertNil(implementationUnderTest.fetchSearchResult(at: 0))
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    }
     
    func testFailureWhenIndexDoesNotExist() {
        implementationUnderTest.retrieveData(forTitle: "", page: 1)
        XCTAssertTrue(mockDelegate.refreshCalled)
        XCTAssertNil(implementationUnderTest.fetchSearchResult(at: -1))
    }
    
    func testSuccessWhenIndexDoesExist() {
        implementationUnderTest.retrieveData(forTitle: "", page: 1)
        XCTAssertTrue(mockDelegate.refreshCalled)
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 0))
    }
    
    func testgetCurrentSearchInfoReturn1ForPageNumberWhenNoCallHasBeenMade() {
        let currentSearchInfo = implementationUnderTest.getCurrentSearchInfo(title: "the flash")
        XCTAssertEqual(1, currentSearchInfo.pageNumber)
        XCTAssertEqual("the+flash", currentSearchInfo.title)
    }
    
    func testgetCurrentSearchInfoReturn2ForPageNumberWhenOneCallHasBeenMade() {
        let title = "the flash"
        implementationUnderTest.search(forTitle: title)
        let currentSearchInfo = implementationUnderTest.getCurrentSearchInfo(title: title)
        XCTAssertEqual(currentSearchInfo.pageNumber, 2)
    }
    
    class MockDelegate: ViewModelDelegate {
        var refreshCalled = false
        var didFailWithErrorCalled = false
        
        func refreshViewContent() {
            refreshCalled = true
        }
        
        func didFailWithError(error: Error) {
            didFailWithErrorCalled = true
        }
    }
}
