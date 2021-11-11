//
//  MainTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

class MainTableViewModel {
    private var movieDetailsRepository: MovieDetailRepositable
    private var searchRepository: SearchRepositable
    private weak var delegate: ViewModelDelegate?
    private var searchRepositoryResponse: SearchModel?
    private(set) var pageNumber = 1
    private var searchResultsList: [Search] = []
    
    var movieDetails: MovieDetails?
    
    init(searchRepository: SearchRepositable, delegate: ViewModelDelegate, movieDetailsRepository: MovieDetailRepositable) {
        self.searchRepository = searchRepository
        self.delegate = delegate
        self.movieDetailsRepository = movieDetailsRepository
    }
    
    func retrieveMovieDetails(at index: Int) {
        guard let imdbID = fetchSelectedImdbID(at: index) else { return }
        movieDetailsRepository.performRequestWith(imdbID: imdbID) {[weak self] result in
            switch result {
            case .success(let response):
                self?.movieDetails = response
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag: true)
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
    
    func retrieveData(forTitle title: String, page: Int) {
        searchRepository.performRequestWith(title: title, pageNumber: page) { [weak self] result in
            switch result {
            case .success(let response):
                self?.searchRepositoryResponse = response
                self?.appendToSearchResults(results: response.results)
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag: false)
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
    
    func initialSearch(forTitle title: String) {
        searchRepositoryResponse = nil
        searchResultsList.removeAll()
        pageNumber = 1
        search(forTitle: title)
    }
    
    func search(forTitle title: String) {
        guard let currentSearch = getCurrentSearchInfo(title: title) else { return }
        retrieveData(forTitle: currentSearch.title, page: currentSearch.pageNumber)
    }
    
    func getCurrentSearchInfo(title: String) -> (title: String, pageNumber: Int)? {
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        guard let numberOfPages = searchRepositoryResponse?.numberOfPages else { return ((title: titleForSearch, pageNumber: pageNumber))}
        if pageNumber < numberOfPages, !(pageNumber > numberOfPages) {
            pageNumber += 1
        } else {
            return nil
        }
        return (title: titleForSearch, pageNumber: pageNumber)
    }
    
    private func appendToSearchResults(results: [Search]) {
        searchResultsList.append(contentsOf: results)
    }
    
    private func fetchSelectedImdbID(at index: Int) -> String? {
        searchResultsList[safe: index]?.imdbID
    }
}

extension MainTableViewModel {
    
    var numberOfRows: Int {
        searchResultsList.count
    }
    
    func fetchSearchResult(at index: Int) -> Search? {
        searchResultsList[safe: index]
    }
}
