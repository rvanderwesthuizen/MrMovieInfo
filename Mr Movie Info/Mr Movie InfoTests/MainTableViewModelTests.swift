//
//  MainTableViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import XCTest
@testable import Mr_Movie_Info

class MainTableViewModelTests: XCTestCase {
    private var implementationUnderTest: MainTableViewModiable!
    private var mockRepository: MockedSearchRepository!
    private var mockDelegate: MockDelegate!
    
    override func setUp() {
        mockDelegate = MockDelegate()
        mockRepository = MockedSearchRepository()
        implementationUnderTest = MainTableViewModel(repository: mockRepository, delegate: mockDelegate)
    }
    
    func testRetrieveDataSuccess() {
        implementationUnderTest.retrieveData(forTitle: "the flash")
        XCTAssertEqual(implementationUnderTest.fetchSearchResult(at: 0)?.title, "the+flash")
        XCTAssertTrue(mockDelegate.refreshCalled)
    }
    
    func testRetrieveDataFailure() {
        mockRepository.shouldFail = true
        implementationUnderTest.retrieveData(forTitle: "")
        XCTAssertFalse(mockDelegate.didFailWithErrorCalled)
    }
    
    func testLoadNextPage() {
        implementationUnderTest.retrieveData(forTitle: "")
        implementationUnderTest.loadNextPage(forTitle: "")
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 1))
    }
    
    func testFailureWhenIndexDoesNotExist() {
        implementationUnderTest.retrieveData(forTitle: "")
        XCTAssertTrue(mockDelegate.refreshCalled)
        XCTAssertNil(implementationUnderTest.fetchSearchResult(at: -1))
    }
    
    func testSuccessWhenIndexDoesExist() {
        implementationUnderTest.retrieveData(forTitle: "")
        XCTAssertTrue(mockDelegate.refreshCalled)
        XCTAssertNotNil(implementationUnderTest.fetchSearchResult(at: 0))
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
