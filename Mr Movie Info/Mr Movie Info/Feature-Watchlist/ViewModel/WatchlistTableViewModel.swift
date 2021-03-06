//
//  WatchlistTableViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/22.
//

import Foundation
import SearchMDFramework

class WatchlistTableViewModel {
    private weak var delegate: ViewModelDelegate?
    private var databaseRepository: DatabaseRepositable
    private(set) var databaseResponse: [MovieDetails] = []
    
    init(databaseRepository: DatabaseRepositable, delegate: ViewModelDelegate) {
        self.databaseRepository = databaseRepository
        self.delegate = delegate
    }
    
    func retrieveWatchlist() {
        databaseRepository.retrieveWatchlist() {[weak self] result in
            switch result {
            case .success(let response):
                self?.databaseResponse = response
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag: false)
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
        
        retrieveWatchlist()
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
