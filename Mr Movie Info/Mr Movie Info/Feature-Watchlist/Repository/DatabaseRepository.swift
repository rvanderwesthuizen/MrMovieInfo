//
//  DatabaseRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/21.
//

import Foundation
import Firebase

typealias databaseRepositoryFetchResponseBlock = (Result<[MovieDetails], Error>) -> Void

@objcMembers final class DatabaseRepository: NSObject {
    
    private var database: DatabaseReference
    private var watchlistRef: DatabaseReference {
        return database.child("Watchlist")
    }
    
    override init() {
        self.database = Database.database().reference()
    }
    
    func addMovieToWatchlist(details: MovieDetails) {
        retrieveWatchlist { result in
            switch result {
            case .success(let response):
                let count = response.count
                for item in response {
                    if item.imdbID == details.imdbID {
                        return
                    } else {
                        self.watchlistRef.child("\(count)").setValue(details.dictionary) { error, _ in
                            if error != nil {
                                print(error!.localizedDescription)
                            }
                        }
                        
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func removeMovieFromWatchlist(at index: Int, failure: @escaping (Error)->Void) {
        watchlistRef.child("\(index)").removeValue { error, _ in
            if error != nil {
                failure(error!)
            }
        }
    }
    
    func retrieveWatchlist(completion: @escaping databaseRepositoryFetchResponseBlock) {
        let urlString = "https://\(Constants.projectID).firebasedatabase.app/Watchlist/.json"
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            print(data)
            do {
                let decodedData = try JSONDecoder().decode([MovieDetails].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
