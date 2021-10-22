//
//  MovieDetailsManager.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

struct MovieDetailsRepository: MovieDetailRepositable {
    
    func performRequestWith(imdbID: String, completion: @escaping movieDetailsRepositoryResponseBlock) {
        let urlString = "\(Constants.baseMoviesURL)&i=\(imdbID)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(error!))
            }
            do {
                let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(movieDetails))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
