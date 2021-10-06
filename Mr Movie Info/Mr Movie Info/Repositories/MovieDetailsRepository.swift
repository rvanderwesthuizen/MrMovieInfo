//
//  MovieDetailsManager.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

struct MovieDetailsRepository: Repositable {
    func performRequest(with title: String, completion: @escaping (Result<Any,Error>)-> Void ) {
        let urlString = "\(Constants.baseMoviesURL)&t=\(title)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(error!))
            }
            do {
                let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data!)
                completion(.success(movieDetails))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
