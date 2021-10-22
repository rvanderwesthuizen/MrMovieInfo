//
//  DatabaseRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/21.
//

import Foundation
import Firebase

typealias databaseRepositoryFetchResponseBlock = (Result<[MovieDetails], Error>) -> Void

final class DatabaseRepository {
    
    private var database: DatabaseReference
    private var watchlistRef: DatabaseReference {
        return database.child("Watchlist")
    }
    
    init() {
        self.database = Database.database().reference()
    }
    
    func addMovieToWatchlist(details: MovieDetails) {
        watchlistRef.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.childrenCount
            print(count)
            self.setValue(details, child: "\(count)")
        }
    }
    
    private func setValue(_ details: MovieDetails, child: String) {
        watchlistRef.child(child).setValue(details.dictionary) { error, _ in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func removeMovieFromWatchlist(at index: Int) {
        watchlistRef.child("\(index)").removeValue()
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
