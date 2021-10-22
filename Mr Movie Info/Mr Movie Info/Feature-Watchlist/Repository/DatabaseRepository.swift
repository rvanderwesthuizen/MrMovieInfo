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
    
    func addMovieToWatchlist(details: MovieDetails) {
        database.child(details.imdbID).setValue(details.dictionary)
    }
    
    func removeMovieFromWatchlist(imdbID: String) {
        database.child(imdbID).removeValue()
    }
    
    func retrieveWatchlist() {
        database.child("id").observeSingleEvent(of: .value) { snapshot in
            if let details = snapshot.value as? [String : String] {
                print("\n\n\(details)\n\n")
            }
        }
    }
}
