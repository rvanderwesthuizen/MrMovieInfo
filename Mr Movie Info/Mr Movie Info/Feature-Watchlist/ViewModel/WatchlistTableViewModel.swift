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
        databaseRepository.retrieveWatchlist()
        delegate?.refreshViewContent()
    }
    
    func removeFromWatchList(imdbID: String) {
        databaseRepository.removeMovieFromWatchlist(imdbID: imdbID)
        delegate?.refreshViewContent()
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
