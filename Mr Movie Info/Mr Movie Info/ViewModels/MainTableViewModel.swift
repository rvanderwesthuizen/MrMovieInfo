//
//  MainTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

class MainTableViewModel {
    private var repository: Repositable
    private var delegate: ViewModelDelegate?
    public var searchResults: SearchModel?
    
    init(repository: Repositable, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    public func retrieveData(forTitle title: String) {
        repository.performRequest(with: title) { [weak self] result in
            do {
                if let data = try result.get() as? SearchModel {
                    self?.searchResults = data
                    self?.delegate?.didRetrieveData()
                }
            } catch {
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}
