////
////  MovieDetailsViewModelTests.swift
////  Mr Movie InfoTests
////
////  Created by Ruan van der Westhuizen on 2021/10/27.
////
//
//import XCTest
//@testable import Mr_Movie_Info
//
//class MovieDetailsViewModelTests: XCTestCase {
//    var mockMovieDetails: MovieDetails!
//    var implementationUnderTest: MovieDetailsViewModel!
//    override func setUp() {
//        mockMovieDetails = MovieDetails(title: "You", year: "2021", rated: "12", released: "132", runtime: "asdf", genre: "kasjdfl", director: "juhnmkiu", writer: "nhyujm", actors: "asdfl;kj", plot: "ythrge", language: "lokinj", awards: "athefo", poster: "poiuyt", imdbRating: "1978234", imdbID: "1234", boxOffice: "8967213", type: "uioewrq", productionStudio: "jklsdfa")
//        implementationUnderTest = MovieDetailsViewModel()
//    }
//
//    func testTitleReturn() {
//        XCTAssertEqual(mockMovieDetails.title, implementationUnderTest.title())
//    }
//
//    func testYearReturn() {
//        XCTAssertEqual(mockMovieDetails.year, implementationUnderTest.year())
//    }
//
//    func testPosterURLReturn() {
//        XCTAssertEqual(mockMovieDetails.poster, implementationUnderTest.posterURL())
//    }
//
//    func testRatedReturn() {
//        XCTAssertEqual(mockMovieDetails.rated, implementationUnderTest.rated())
//    }
//
//    func testReleasedReturn() {
//        XCTAssertEqual(mockMovieDetails.released, implementationUnderTest.released())
//    }
//
//    func testRuntimeReturn() {
//        XCTAssertEqual(mockMovieDetails.runtime, implementationUnderTest.runtime())
//    }
//
//    func testGenreReturn() {
//        XCTAssertEqual(mockMovieDetails.genre, implementationUnderTest.genre())
//    }
//
//    func testDirectorsReturn() {
//        XCTAssertEqual(mockMovieDetails.director, implementationUnderTest.directors())
//    }
//
//    func testWritersReturn() {
//        XCTAssertEqual(mockMovieDetails.writer, implementationUnderTest.writer())
//    }
//
//    func testActorsReturn() {
//        XCTAssertEqual(mockMovieDetails.actors, implementationUnderTest.actors())
//    }
//
//    func testImdbRatingReturn() {
//        XCTAssertEqual(mockMovieDetails.imdbRating, implementationUnderTest.imdbRating())
//    }
//
//    func testBoxOfficeReturn() {
//        XCTAssertEqual(mockMovieDetails.boxOffice, implementationUnderTest.boxOffice())
//    }
//
//    func testProductionStudioReturn() {
//        XCTAssertEqual(mockMovieDetails.productionStudio, implementationUnderTest.productionStudio())
//    }
//}
