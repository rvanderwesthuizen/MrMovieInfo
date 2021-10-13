//
//  MockedMainTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import Foundation

class MockedMainTableViewModel: MainTableViewModiable {
    private var repository: SearchRepositable
    private var searchRepositoryResponse: SearchModel?
    private var pageNumber = 1
    private var searchResultsList: [Search] = []
    
    init(repository: SearchRepositable) {
        self.repository = repository
    }
    
    public func retrieveData(forTitle title: String) {
        searchResultsList.removeAll()
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        repository.performRequestWith(title: titleForSearch, pageNumber: 1) { [weak self] result in
            switch result {
            case .success(let response):
                self?.searchRepositoryResponse = response
                self?.appendToSearchResults(results: response.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func loadNextPage(forTitle title: String) {
        guard let numberOfPages = searchRepositoryResponse?.numberOfPages else { return }
        let titleForSearch = title.replacingOccurrences(of: " ", with: "+")
        if pageNumber < numberOfPages {
            pageNumber += 1
            repository.performRequestWith(title: titleForSearch, pageNumber: pageNumber) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.appendToSearchResults(results: response.results)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func appendToSearchResults(results: [Search]) {
        searchResultsList.append(contentsOf: results)
    }
}

extension MockedMainTableViewModel {
    
    public var numberOfRows: Int {
        searchResultsList.count
    }
    
    public func fetchSearchResult(at index: Int) -> Search? {
        searchResultsList[safe: index]
    }
}
