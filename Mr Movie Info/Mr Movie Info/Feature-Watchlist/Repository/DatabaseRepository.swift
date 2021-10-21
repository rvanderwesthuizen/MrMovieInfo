//
//  DatabaseRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/21.
//

import Foundation
import Firebase

typealias databaseRepositoryResponseBlock = ((Result<MovieDetails, Error>) -> Void)

@objcMembers final class DatabaseRepository: NSObject {
    
    private var database: DatabaseReference
    
    override init() {
        self.database = Database.database().reference()
    }
    
    func addMovieToWatchlist(imdbID: String, details: MovieDetails) {
        database.child(imdbID).setValue(details)
    }
    
    func removeMovieFromWatchlist(imdbID: String) {
        database.child(imdbID).removeValue()
    }
    
    func retrieveWatchlist(completion: @escaping databaseRepositoryResponseBlock) {
        database.observe(.value) { snapshot in
            if let details = snapshot.value as? MovieDetails {
                completion(.success(details))
            }
        }
    }
}
