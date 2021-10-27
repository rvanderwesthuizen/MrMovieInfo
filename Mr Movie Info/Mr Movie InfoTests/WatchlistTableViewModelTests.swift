//
//  WatchlistTableViewModelTests.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import XCTest
@testable import Mr_Movie_Info

class WatchlistTableViewModelTests: XCTestCase {
    var implementationUnderTest: WatchlistTableViewModel!
    var mockRepository: MockDatabaseRepository!
    var mockDelegate: MockDelegate!
    var mockDetails = MovieDetails(title: "", year: "", rated: "", released: "", runtime: "", genre: "", director: "", writer: "", actors: "", plot: "", language: "", awards: "", poster: "", imdbRating: "", imdbID: "", boxOffice: "", type: "", productionStudio: "")
    override func setUp() {
        mockRepository = MockDatabaseRepository()
        mockDelegate = MockDelegate()
        implementationUnderTest = WatchlistTableViewModel(databaseRepository: mockRepository, delegate: mockDelegate)
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
    
    func testRetrieveWatchlistSuccess() {
        mockRepository.shouldFail = false
        mockRepository.addMovieToWatchlist(details: mockDetails)
        implementationUnderTest.retrieveWatchlist()
        XCTAssertFalse(implementationUnderTest.databaseResponse.isEmpty)
        XCTAssertTrue(mockDelegate.refreshCalled)
    }
    
    func testRetrieveWatchlistFailure() {
        mockRepository.shouldFail = true
        implementationUnderTest.retrieveWatchlist()
        XCTAssertTrue(implementationUnderTest.databaseResponse.isEmpty)
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    }
    
    func testNumberOfRows() {
        mockRepository.shouldFail = false
        mockRepository.addMovieToWatchlist(details: mockDetails)
        implementationUnderTest.retrieveWatchlist()
        XCTAssertEqual(implementationUnderTest.numberOfRows, 1)
    }
    
    func testFetchMovie() {
        mockRepository.shouldFail = false
        mockRepository.addMovieToWatchlist(details: mockDetails)
        implementationUnderTest.retrieveWatchlist()
        XCTAssertNotNil(implementationUnderTest.fetchMovie(at: 0))
        XCTAssertTrue(mockDelegate.refreshCalled)
    }
    
    func testFetchMovieIfRepoFails() {
        mockRepository.shouldFail = true
        implementationUnderTest.retrieveWatchlist()
        XCTAssertNil(implementationUnderTest.fetchMovie(at: 0))
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    }
}
