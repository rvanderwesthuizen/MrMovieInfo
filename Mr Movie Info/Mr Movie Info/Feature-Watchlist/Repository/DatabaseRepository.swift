//
//  DatabaseRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/21.
//

import Foundation
import Firebase

typealias databaseRepositoryResponseBlock = ((Result<MovieDetails, Error>) -> Void)

final class DatabaseRepository {
    
    private var database: DatabaseReference
    private var watchListRef: DatabaseReference {
        database.child("WatchList")
    }
    
    init() {
        self.database = Database.database().reference()
    }
    
    func addMovieToWatchlist(imdbID: String, details: MovieDetails) {
        watchListRef.setValue(details)
    }
    
    func removeMovieFromWatchlist(imdbID: String) {
        watchListRef.removeValue()
    }
    
    func retrieveWatchlist(completion: @escaping databaseRepositoryResponseBlock) {
        watchListRef.observe( .value) { snapshot in
            if let details = snapshot.value as? MovieDetails {
                completion(.success(details))
            }
        }
    }
}
