
//
//  TrailerViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/25.
//

import XCTest
@testable import Mr_Movie_Info

class TrailerViewModelTests: XCTestCase {
    var mockDelegate: MockDelegate!
    var mockRepository: MockYoutubeRepository!
    var implementationUnderTest: TrailerViewModel!
    
    override func setUp() {
        mockDelegate = MockDelegate()
        mockRepository = MockYoutubeRepository()
        implementationUnderTest = TrailerViewModel(repository: mockRepository, delegate: mockDelegate)
        implementationUnderTest.setupWith(title: "Movie Title")
    }
    
    class MockDelegate: ViewModelDelegate {
        var refreshViewContentCalled = false
        var didFailWitchErrorCalled = false
        
        func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
            refreshViewContentCalled = true
        }
        
        func didFailWithError(error: Error) {
            didFailWitchErrorCalled = true
        }
    }
    
    //MARK: - Tests
    func testRetrieveVideoIDDoesReturnID() {
        XCTAssertTrue(mockDelegate.refreshViewContentCalled)
        XCTAssertEqual("1234", implementationUnderTest.videoID)
    }
    
    func testRetrieveVideoIDWhenRepositoryFails() {
        mockRepository.shouldFail = true
        implementationUnderTest.retrieveVideoID()
        XCTAssertTrue(mockDelegate.didFailWitchErrorCalled)
    }
}
