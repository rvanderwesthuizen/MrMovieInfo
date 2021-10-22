//
//  WatchlistTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/22.
//

import Foundation

class WatchlistTableViewModel {
    private weak var delegate: ViewModelDelegate?
    private var databaseRepository: DatabaseRepository
    private var databaseResponse: [MovieDetails] = []
    
    init(databaseRepository: DatabaseRepository, delegate: ViewModelDelegate) {
        self.databaseRepository = databaseRepository
        self.delegate = delegate
    }
    
    func retrieveWatchlist() {
        databaseRepository.retrieveWatchlist() {[weak self] result in
            switch result {
            case .success(let response):
                self?.databaseResponse = response
                self?.delegate?.refreshViewContent()
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
    
    func removeFromWatchList(at index: Int) {
        databaseRepository.removeMovieFromWatchlist(at: index) { error in
            self.delegate?.didFailWithError(error: error)
            return
        }
        
        databaseRepository.retrieveWatchlist() {[weak self] result in
            switch result {
            case .success(let response):
                self?.databaseResponse = response
                self?.delegate?.refreshViewContent()
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}

extension WatchlistTableViewModel {
    var numberOfRows: Int {
        databaseResponse.count
    }
    
    func fetchMovie(at index: Int) -> MovieDetails? {
        databaseResponse[safe: index]
    }
}
