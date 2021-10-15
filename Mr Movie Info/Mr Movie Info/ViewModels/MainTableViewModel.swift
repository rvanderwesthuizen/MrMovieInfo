//
//  MainTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

class MainTableViewModel {
    private var repository: SearchRepositable
    private weak var delegate: ViewModelDelegate?
    private var searchRepositoryResponse: SearchModel?
    private var pageNumber = 1
    private var searchResultsList: [Search] = []
    
    init(repository: SearchRepositable, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    func retrieveData(forTitle title: String, page: Int) {
        repository.performRequestWith(title: title, pageNumber: page) { [weak self] result in
            switch result {
            case .success(let response):
                self?.searchRepositoryResponse = response
                self?.appendToSearchResults(results: response.results)
                self?.delegate?.refreshViewContent()
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
    
    func initialSearch(forTitle title: String) {
        searchResultsList.removeAll()
        pageNumber = 1
        search(forTitle: title)
    }
    
    func search(forTitle title: String) {
        let currentSearch = getCurrentSearchInfo(title: title)
        retrieveData(forTitle: currentSearch.title, page: currentSearch.pageNumber)
    }
    
    func getCurrentSearchInfo(title: String) -> (title: String, pageNumber: Int) {
        if let numberOfPages = searchRepositoryResponse?.numberOfPages {
            if pageNumber < numberOfPages {
                pageNumber += 1
            }
        }
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        return (title: titleForSearch, pageNumber: pageNumber)
    }
    
    private func appendToSearchResults(results: [Search]) {
        searchResultsList.append(contentsOf: results)
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
