//
//  MainTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

class MainTableViewModel {
    private var repository: Repositable
    private weak var delegate: ViewModelDelegate?
    private var searchResults: SearchModel?
    
    init(repository: Repositable, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    public func retrieveData(forTitle title: String) {
        repository.performRequest(with: title) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response as? SearchModel else { return }
                self?.searchResults = response
                self?.delegate?.refreshViewContent()
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}

extension MainTableViewModel {
    public var numberOfRows: Int {
        searchResults?.results.count ?? 0
    }
    
    func fetchTitle(at index: Int) -> String {
        searchResults?.results[safe: index]?.title ?? ""
    }
}
