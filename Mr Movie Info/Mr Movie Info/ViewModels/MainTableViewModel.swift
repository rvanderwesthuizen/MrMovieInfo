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
    
    func retrieveData(forTitle title: String) {
        searchResultsList.removeAll()
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        repository.performRequestWith(title: titleForSearch, pageNumber: 1) { [weak self] result in
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
    
    func loadNextPage(forTitle title: String) {
        guard let numberOfPages = searchRepositoryResponse?.numberOfPages else { return }
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        if pageNumber < numberOfPages {
            pageNumber += 1
            repository.performRequestWith(title: titleForSearch, pageNumber: pageNumber) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.appendToSearchResults(results: response.results)
                    self?.delegate?.refreshViewContent()
                case .failure(let error):
                    self?.delegate?.didFailWithError(error: error)
                }
            }
        }
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
